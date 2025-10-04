# Multi-Agent Stock Analyst (Google ADK Demo)

This project demonstrates a multi-agent system built using the Google Agent Development Kit (ADK). It analyzes a given company's stock by orchestrating several specialized agents:

*   **News Agent:** Fetches recent news headlines.
*   **Historical Agent:** Analyzes historical stock performance.
*   **Economic Agent:** Assesses relevant macroeconomic factors.
*   **Political Agent:** Analyzes the political and regulatory landscape.
*   **Synthesizer Agent (Root):** Coordinates the other agents (as tools), synthesizes their findings, and provides a final investment recommendation (Buy/Sell/Hold) with justification.

## Prerequisites

*   Python 3.9+
*   Google ADK library (`google-adk`)
*   Google Generative AI library (`google-generativeai`)
*   Python Dotenv library (`python-dotenv`)
*   A Google API Key with the Gemini API enabled (obtainable from [Google AI Studio](https://aistudio.google.com/app/apikey)).

You can install the required libraries using pip:
```bash
pip install google-adk google-generativeai python-dotenv
```

## Setup

1.  **Clone/Download:** Ensure you have the project files in a local directory.
2.  **API Key:**
    *   Create a file named `.env` inside the `Multi-Agent-Stock-Analyist` directory.
    *   Add your Google API Key to the `.env` file like this:
        ```env
        GOOGLE_API_KEY='YOUR_API_KEY_HERE'
        ```
        Replace `YOUR_API_KEY_HERE` with your actual key.

## Running the Agent

There are two primary ways to run this agent:

**Method 1: Using ADK Web UI (Recommended)**

This method uses the standard ADK tooling and treats the project as a Python package.

1.  **Code Configuration:**
    *   Ensure the agent imports in `agent.py` are **relative**:
        ```python
        # agent.py
        from .news_agent import news_agent
        from .historical_agent import historical_agent
        from .economic_agent import economic_agent
        from .political_agent import political_agent
        # ... rest of the file
        ```
    *   Ensure the `__init__.py` file exists and contains:
        ```python
        # __init__.py
        from . import agent
        ```

2.  **Run Command:**
    *   Open your terminal and navigate to the directory *containing* the `Multi-Agent-Stock-Analyist` folder (e.g., `Experiments/ADK-Series/`).
    *   Run the command:
        ```bash
        adk web
        ```
    *   Open the provided URL (usually `http://localhost:8000`) in your browser.
    *   Select `Multi-Agent-Stock-Analyist` from the agent dropdown.
    *   Enter the company name you want to analyze (e.g., "Tesla", "Analyze Google Stock") in the chat interface.

**Method 2: Using `cli.py` (Direct Script Execution)**

This method runs the agent using a custom command-line interface script.

1.  **Code Configuration:**
    *   Modify the agent imports in `agent.py` to be **absolute** (remove the leading dot):
        ```python
        # agent.py
        from news_agent import news_agent
        from historical_agent import historical_agent
        from economic_agent import economic_agent
        from political_agent import political_agent
        # ... rest of the file
        ```
    *   *(The `__init__.py` file content doesn't strictly matter for this method, but it's needed for Method 1).*

2.  **Run Command:**
    *   Open your terminal and navigate *directly into* the `Multi-Agent-Stock-Analyist` directory.
    *   Run the script using python:
        ```bash
        python cli.py
        ```
    *   It will prompt you to enter a company name (press Enter to default to Microsoft).
    *   Alternatively, provide the company name as an argument:
        ```bash
        python cli.py "Company Name"
        ```
        (e.g., `python cli.py Apple`)

## Project Structure

```
Multi-Agent-Stock-Analyist/
├── .env                # Stores API key (needs to be created)
├── __init__.py         # Makes the directory a package (required for adk web)
├── agent.py            # Defines the root synthesizer agent and AgentTools
├── cli.py              # Custom command-line interface script
├── economic_agent.py   # Defines the economic analysis agent
├── historical_agent.py # Defines the historical analysis agent
├── news_agent.py       # Defines the news gathering agent
├── political_agent.py  # Defines the political/regulatory agent
└── README.md           # This file
``` 