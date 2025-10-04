"""
Main entry point for Cloud Run deployment of Multi-Agent Stock Analyzer.
This file creates a web application using Google ADK's web framework.
"""

import os
from google.adk.web.run import create_app

# Import the root agent
from agent import root_agent

# Create the ADK web application
app = create_app()

if __name__ == "__main__":
    # Get port from environment variable (Cloud Run sets this)
    port = int(os.environ.get("PORT", 8080))
    
    # Run the application
    app.run(host="0.0.0.0", port=port, debug=False)
