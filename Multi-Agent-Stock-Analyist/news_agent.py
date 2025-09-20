from google.adk.agents import Agent
from google.adk.tools import google_search

news_agent = Agent(
    model="gemini-2.0-flash",
    name="news_reporter",
    description="Gathers recent news headlines for a company.",
    instruction="""You are a financial news reporter. Use the google_search tool to find 5 recent news headlines about the specified company that are relevant to its financial performance or stock valuation. Include publication dates if available.

Company: [Company Name]

For each headline, provide a brief (1-2 sentence) summary and indicate the likely sentiment (Positive, Negative, Neutral) towards the company's stock.
Present the information as a numbered list. Output ONLY the numbered list of headlines, summaries, and sentiments.
Provide a concise overall summary of the news sentiment if possible.
""",
    tools=[google_search]
) 