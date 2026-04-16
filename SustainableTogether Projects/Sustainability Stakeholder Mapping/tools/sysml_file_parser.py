"""
SysML file parser for stakeholder mapping.

Parses local .sysml files to extract stakeholder and relationship part usages.
Replaces REST API dependency with direct file parsing.
"""

import re
from pathlib import Path
from typing import List, Dict, Any, Tuple


class SysMLFileParser:
    """Parses SysML textual notation files to extract stakeholder and relationship data."""

    def __init__(self, instances_file_path: Path):
        """
        Initialize parser with path to instances file.

        Args:
            instances_file_path: Path to StakeholderMapping_Instances.sysml
        """
        self.instances_file = Path(instances_file_path)
        self.content = self._read_file()

    def _read_file(self) -> str:
        """Read the SysML file content."""
        try:
            with open(self.instances_file, "r", encoding="utf-8") as f:
                return f.read()
        except FileNotFoundError:
            raise FileNotFoundError(f"SysML file not found: {self.instances_file}")

    def extract_part_usages(self) -> Tuple[List[Dict[str, Any]], List[Dict[str, Any]]]:
        """
        Extract stakeholder and relationship part usages from the file.

        Returns:
            Tuple of (stakeholders, relationships)
        """
        stakeholders = []
        relationships = []

        # Find all part usages manually by tracking braces
        # This handles nested structures better than regex
        lines = self.content.split('\n')
        i = 0
        while i < len(lines):
            line = lines[i].strip()

            # Look for part declaration
            part_match = re.match(r"part\s+(\w+)\s*:\s*(\w+)\s*\{?", line)
            if part_match:
                part_name = part_match.group(1)
                part_type = part_match.group(2)

                # Extract the body by collecting lines until closing brace
                brace_count = line.count('{') - line.count('}')
                body_lines = [line]

                j = i + 1
                while brace_count > 0 and j < len(lines):
                    body_lines.append(lines[j])
                    brace_count += lines[j].count('{') - lines[j].count('}')
                    j += 1

                part_body = '\n'.join(body_lines)

                # Parse attributes from the body
                attributes = self._parse_attributes(part_body)
                attributes["declaredName"] = part_name
                attributes["@type"] = "PartUsage"
                attributes["type"] = part_type

                # Classify based on type
                if part_type in ["IncoseStakeholder", "ExternalStakeholder"]:
                    stakeholders.append(attributes)
                elif part_type == "Relationship":
                    relationships.append(attributes)

                i = j
            else:
                i += 1

        return stakeholders, relationships

    def _parse_attributes(self, body: str) -> Dict[str, Any]:
        """
        Parse attribute assignments from a part usage body.

        Matches: attribute <name> = <value>;

        Args:
            body: Content inside the part definition braces

        Returns:
            Dictionary of attribute name -> value
        """
        attributes = {}

        # Pattern for attribute assignments
        # Handles: strings (quoted), enums, integers, dates, arrays, etc.
        attr_pattern = r"attribute\s+(\w+)\s*=\s*([^;]+);"

        for match in re.finditer(attr_pattern, body):
            attr_name = match.group(1)
            attr_value_str = match.group(2).strip()

            # Parse the value
            value = self._parse_value(attr_value_str)
            attributes[attr_name] = value

        return attributes

    def _parse_value(self, value_str: str) -> Any:
        """
        Parse a SysML attribute value.

        Handles:
        - Strings: "text" → text
        - Enums: Category::InsideINCOSE → "InsideINCOSE"
        - Integers: 123 → 123
        - Booleans: true/false → True/False
        - Arrays: { value1, value2 } → [value1, value2]
        - Dates: "2023-06-01" → "2023-06-01"

        Args:
            value_str: String representation of the value

        Returns:
            Parsed Python value
        """
        value_str = value_str.strip()

        # String literal
        if value_str.startswith('"') and value_str.endswith('"'):
            return value_str[1:-1]

        # Array/collection: { val1, val2, ... }
        if value_str.startswith("{") and value_str.endswith("}"):
            inner = value_str[1:-1].strip()
            if not inner:
                return []
            items = [self._parse_value(item.strip()) for item in inner.split(",")]
            return items

        # Enum reference: EnumType::EnumValue
        if "::" in value_str:
            parts = value_str.split("::")
            return parts[-1]  # Return just the enum value name

        # Boolean
        if value_str.lower() == "true":
            return True
        if value_str.lower() == "false":
            return False

        # Integer
        try:
            return int(value_str)
        except ValueError:
            pass

        # Float
        try:
            return float(value_str)
        except ValueError:
            pass

        # Default: return as string
        return value_str

    def get_stakeholder_by_id(
        self, stakeholder_id: str, stakeholders: List[Dict[str, Any]]
    ) -> Dict[str, Any]:
        """
        Find stakeholder by ID.

        Args:
            stakeholder_id: The id attribute value to search for
            stakeholders: List of parsed stakeholders

        Returns:
            Stakeholder dictionary or empty dict if not found
        """
        for stakeholder in stakeholders:
            if stakeholder.get("id") == stakeholder_id:
                return stakeholder
        return {}

    def validate_relationships(
        self,
        relationships: List[Dict[str, Any]],
        stakeholders: List[Dict[str, Any]],
    ) -> List[str]:
        """
        Validate that all relationships reference valid stakeholders.

        Args:
            relationships: List of parsed relationships
            stakeholders: List of parsed stakeholders

        Returns:
            List of error messages (empty if valid)
        """
        errors = []
        stakeholder_ids = {s.get("id") for s in stakeholders}

        for rel in relationships:
            source_id = rel.get("sourceStakeholderId")
            target_id = rel.get("targetStakeholderId")
            rel_id = rel.get("id", "unknown")

            if source_id not in stakeholder_ids:
                errors.append(f"Relationship {rel_id}: source stakeholder {source_id} not found")
            if target_id not in stakeholder_ids:
                errors.append(f"Relationship {rel_id}: target stakeholder {target_id} not found")

        return errors
