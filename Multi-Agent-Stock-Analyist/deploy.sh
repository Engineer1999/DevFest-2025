#!/bin/bash

# Multi-Agent Stock Analyzer - Cloud Run Deployment Script
# This script deploys the application to Google Cloud Run using ADK CLI

# Set default values
PROJECT_ID=${GOOGLE_CLOUD_PROJECT:-"devfest-2025-472412"}
REGION=${GOOGLE_CLOUD_LOCATION:-"asia-south1"}
SERVICE_NAME=${SERVICE_NAME:-"adk-finance-analyst"}
APP_NAME=${APP_NAME:-"stock-analyzer"}
AGENT_PATH=${AGENT_PATH:-"/Users/bhargav/Desktop/My-Computer/Blogs/Blog-Resources/Multi-Agent-Stock-Analyist"}

echo "🚀 Deploying Multi-Agent Stock Analyzer to Cloud Run"
echo "Project: $PROJECT_ID"
echo "Region: $REGION"
echo "Service: $SERVICE_NAME"
echo "App: $APP_NAME"
echo ""



# Deploy using ADK CLI
echo "📦 Deploying with ADK CLI..."
adk deploy cloud_run \
    --project=$PROJECT_ID \
    --region=$REGION \
    --service_name=$SERVICE_NAME \
    --app_name=$APP_NAME \
    --with_ui \
    $AGENT_PATH

echo ""
echo "✅ Deployment completed!"
echo "🌐 Your application should be available at the URL shown above"
echo ""
echo "📝 To test your deployment:"
echo "   1. Visit the URL in your browser"
echo "   2. Select '$APP_NAME' from the agent dropdown"
echo "   3. Enter a company name to analyze (e.g., 'Tesla')"
echo ""
echo "🔧 To update environment variables:"
echo "   gcloud run services update $SERVICE_NAME --region=$REGION --set-env-vars=KEY=VALUE"
