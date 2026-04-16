"""
SysML v2 REST API client for stakeholder mapping.

Fetches stakeholder and relationship part usages from the SysML v2 REST API.
Filters by element type and parses attribute values.
"""

import requests
from typing import List, Dict, Any, Optional
from config import SYSML_ELEMENTS_ENDPOINT

class SysMLClient:
    """Client for querying SysML v2 REST API."""

    def __init__(self, base_url: str, project_id: str):
        self.base_url = base_url
        self.project_id = project_id
        self.elements_endpoint = SYSML_ELEMENTS_ENDPOINT
        self.session = requests.Session()

    def fetch_all_elements(self) -> List[Dict[str, Any]]:
        """
        Fetch all elements from the project.

        Returns:
            List of element dictionaries from the API.
        """
        try:
            response = self.session.get(self.elements_endpoint, timeout=30)
            response.raise_for_status()
            data = response.json()

            # Handle paginated response
            if isinstance(data, dict) and "data" in data:
                elements = data["data"]
            elif isinstance(data, list):
                elements = data
            else:
                raise ValueError(f"Unexpected API response structure: {data.keys()}")

            print(f"Fetched {len(elements)} elements from SysML API")
            return elements

        except requests.exceptions.RequestException as e:
            print(f"Error fetching elements from SysML API: {e}")
            raise

    def filter_stakeholders(
        self, elements: List[Dict[str, Any]]
    ) -> tuple[List[Dict[str, Any]], List[Dict[str, Any]]]:
        """
        Filter elements into INCOSE and external stakeholders.

        Stakeholders are identified by being PartUsage with type field
        matching IncoseStakeholder or ExternalStakeholder.

        Args:
            elements: List of all elements from API

        Returns:
            Tuple of (incose_stakeholders, external_stakeholders)
        """
        incose_stakeholders = []
        external_stakeholders = []

        for element in elements:
            # Check if this is a part usage
            if element.get("@type") != "PartUsage":
                continue

            # Inspect the type field to determine stakeholder class
            type_field = element.get("type", {})
            if isinstance(type_field, dict):
                type_ref = type_field.get("@id", "")
            else:
                type_ref = str(type_field)

            # Classify by type reference
            if "IncoseStakeholder" in type_ref:
                incose_stakeholders.append(element)
            elif "ExternalStakeholder" in type_ref:
                external_stakeholders.append(element)

        print(
            f"Filtered: {len(incose_stakeholders)} INCOSE stakeholders, "
            f"{len(external_stakeholders)} external stakeholders"
        )
        return incose_stakeholders, external_stakeholders

    def filter_relationships(self, elements: List[Dict[str, Any]]) -> List[Dict[str, Any]]:
        """
        Filter elements into Relationship part usages.

        Args:
            elements: List of all elements from API

        Returns:
            List of relationship elements
        """
        relationships = []

        for element in elements:
            # Check if this is a part usage typed to Relationship
            if element.get("@type") != "PartUsage":
                continue

            type_field = element.get("type", {})
            if isinstance(type_field, dict):
                type_ref = type_field.get("@id", "")
            else:
                type_ref = str(type_field)

            if "Relationship" in type_ref and "Stakeholder" not in type_ref:
                relationships.append(element)

        print(f"Filtered: {len(relationships)} relationships")
        return relationships

    def extract_attribute_value(
        self, element: Dict[str, Any], attribute_name: str
    ) -> Optional[Any]:
        """
        Extract attribute value from a part usage element.

        Handles both literal values and references to enum values.

        Args:
            element: Element dictionary from API
            attribute_name: Name of the attribute to extract

        Returns:
            The attribute value, or None if not found
        """
        # Look in the ownedAttributeValues array
        owned_values = element.get("ownedAttributeValues", [])
        for attr_value in owned_values:
            if attr_value.get("declaredName") == attribute_name or attr_value.get("name") == attribute_name:
                # Try to get the value
                value = attr_value.get("value")
                if value is not None:
                    return value

                # If value is null, check for references (enum values, etc.)
                result = attr_value.get("result")
                if result:
                    return result

        return None

    def parse_stakeholder(self, element: Dict[str, Any]) -> Dict[str, Any]:
        """
        Parse a stakeholder element into a dictionary.

        Args:
            element: PartUsage element from API

        Returns:
            Dictionary with parsed stakeholder data
        """
        stakeholder = {
            "@id": element.get("@id"),
            "declaredName": element.get("declaredName"),
            "name": self.extract_attribute_value(element, "name"),
            "id": self.extract_attribute_value(element, "id"),
            "engagementStatus": self.extract_attribute_value(element, "engagementStatus"),
            "priorityLevel": self.extract_attribute_value(element, "priorityLevel"),
            "engagementScore": self.extract_attribute_value(element, "engagementScore"),
            "orgType": self.extract_attribute_value(element, "orgType"),
            "primaryDomainFocus": self.extract_attribute_value(element, "primaryDomainFocus"),
            "audienceServed": self.extract_attribute_value(element, "audienceServed"),
            "fundingModel": self.extract_attribute_value(element, "fundingModel"),
        }
        return stakeholder

    def parse_relationship(self, element: Dict[str, Any]) -> Dict[str, Any]:
        """
        Parse a relationship element into a dictionary.

        Args:
            element: PartUsage element from API

        Returns:
            Dictionary with parsed relationship data
        """
        relationship = {
            "@id": element.get("@id"),
            "declaredName": element.get("declaredName"),
            "id": self.extract_attribute_value(element, "id"),
            "sourceStakeholderId": self.extract_attribute_value(element, "sourceStakeholderId"),
            "targetStakeholderId": self.extract_attribute_value(element, "targetStakeholderId"),
            "relationshipType": self.extract_attribute_value(element, "relationshipType"),
            "direction": self.extract_attribute_value(element, "direction"),
            "strengthFrequency": self.extract_attribute_value(element, "strengthFrequency"),
            "dateEstablished": self.extract_attribute_value(element, "dateEstablished"),
            "flowTypes": self.extract_attribute_value(element, "flowTypes"),
            "collaborationPotentialScore": self.extract_attribute_value(element, "collaborationPotentialScore"),
        }
        return relationship
