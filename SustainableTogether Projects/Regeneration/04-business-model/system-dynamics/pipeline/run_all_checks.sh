#!/usr/bin/env bash
# run_all_checks.sh — single entry point for the full machine-V&V suite.
# Usage: ./run_all_checks.sh [registry.xlsx]
# Exit non-zero on ANY failure. Every agent step ends with this command.
set -uo pipefail
cd "$(dirname "$0")"
REG="${1:-../SustainaSun_Concept_Registry.xlsx}"
FAIL=0

step() { echo; echo "=== $1 ==="; }

step "1/4 Invariant validation (I1-I7) on $REG"
python3 validate_registry.py "$REG" --json report_latest.json || FAIL=1

step "2/4 Defect-injection regression (validator self-test)"
python3 regression_test.py "$REG" || FAIL=1

step "3/4 Registry -> RDF round-trip + SHACL"
if [ -f xlsx2rdf.py ] && python3 -c "import rdflib" 2>/dev/null; then
    python3 xlsx2rdf.py "$REG" -o registry_latest.ttl || FAIL=1
    if python3 -c "import pyshacl" 2>/dev/null && [ -f shapes.ttl ]; then
        python3 -m pyshacl --allow-warnings -s shapes.ttl -e fbmc-cld.ttl registry_latest.ttl || FAIL=1
    else
        echo "SKIP: pyshacl or shapes.ttl not available"; [ "${ALLOW_SKIPS:-0}" = "1" ] || FAIL=1
    fi
else
    echo "SKIP: xlsx2rdf.py or rdflib not available"; [ "${ALLOW_SKIPS:-0}" = "1" ] || FAIL=1
fi

step "4/4 CLD generation round-trip"
if [ -f registry2cld.py ]; then
    python3 registry2cld.py "$REG" -o cld_latest.drawio --verify || FAIL=1
else
    echo "SKIP: registry2cld.py not present"; [ "${ALLOW_SKIPS:-0}" = "1" ] || FAIL=1
fi

echo
if [ "$FAIL" -eq 0 ]; then
    echo "ALL CHECKS PASSED"
else
    echo "CHECKS FAILED"
fi
exit $FAIL
