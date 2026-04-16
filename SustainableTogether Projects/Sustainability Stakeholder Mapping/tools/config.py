"""
Configuration module for SysML Stakeholder Mapping network analysis pipeline.

Loads environment variables for SysML v2 REST API access.
Create a .env file in the project root with:
    SYSML_API_BASE_URL=https://api.sysml.omg.org
    SYSML_PROJECT_ID=<your-project-uuid>
"""

import os
from pathlib import Path
from dotenv import load_dotenv

# Load environment variables from .env file (one level up from tools/)
env_path = Path(__file__).parent.parent / ".env"
load_dotenv(dotenv_path=env_path, verbose=True)

# SysML v2 REST API configuration
SYSML_API_BASE_URL = os.getenv("SYSML_API_BASE_URL", "https://api.sysml.omg.org")
SYSML_PROJECT_ID = os.getenv("SYSML_PROJECT_ID", "")

if not SYSML_PROJECT_ID:
    raise ValueError(
        "SYSML_PROJECT_ID not set in environment. "
        "Create a .env file in the project root with SYSML_PROJECT_ID=<uuid>"
    )

# Derived API endpoints
SYSML_ELEMENTS_ENDPOINT = f"{SYSML_API_BASE_URL}/projects/{SYSML_PROJECT_ID}/elements"

# Network analysis configuration
NETWORK_ANALYSIS_CONFIG = {
    "min_nodes_for_analysis": 30,  # Minimum nodes before meaningful metrics
    "community_detection_method": "greedy_modularity",  # or "louvain"
    "temporal_window_days": 365,  # For dormancy scoring
}

print(f"SysML API Base URL: {SYSML_API_BASE_URL}")
print(f"Project ID: {SYSML_PROJECT_ID}")
print(f"Elements endpoint: {SYSML_ELEMENTS_ENDPOINT}")
