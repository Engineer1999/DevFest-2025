# Multi-Agent Stock Analyzer - Cloud Run Deployment Guide

This guide explains how to deploy the Multi-Agent Stock Analyzer to Google Cloud Run using Google ADK.

## 🚀 Quick Deployment

### Prerequisites
- Google Cloud Project with billing enabled
- Google Cloud CLI installed and authenticated
- ADK CLI installed (`pip install google-adk`)

### Step 1: Set Environment Variables
```bash
export GOOGLE_CLOUD_PROJECT="your-project-id"
export GOOGLE_CLOUD_LOCATION="us-central1"
export GOOGLE_GENAI_USE_VERTEXAI=True
```

### Step 2: Enable Required APIs
```bash
gcloud services enable run.googleapis.com
gcloud services enable artifactregistry.googleapis.com
gcloud services enable cloudbuild.googleapis.com
gcloud services enable aiplatform.googleapis.com
```

### Step 3: Deploy
```bash
# Option 1: Use the deployment script
./deploy.sh

# Option 2: Use ADK CLI directly
adk deploy cloud_run \
    --project=$GOOGLE_CLOUD_PROJECT \
    --region=$GOOGLE_CLOUD_LOCATION \
    --service_name=multi-agent-stock-analyzer \
    --app_name=stock-analyzer \
    --with_ui \
    .
```

## 🔧 Manual Deployment Steps

### 1. Authenticate with Google Cloud
```bash
gcloud auth login
gcloud auth application-default login
gcloud config set project YOUR_PROJECT_ID
```

### 2. Deploy with ADK CLI
```bash
adk deploy cloud_run \
    --project=YOUR_PROJECT_ID \
    --region=us-central1 \
    --service_name=multi-agent-stock-analyzer \
    --app_name=stock-analyzer \
    --with_ui \
    .
```

### 3. Test Your Deployment
After deployment, you'll get a URL like:
`https://multi-agent-stock-analyzer-abc123xyz.a.run.app`

1. Visit the URL in your browser
2. Select "stock-analyzer" from the agent dropdown
3. Enter a company name (e.g., "Tesla")
4. Click "Send" to analyze the stock

## 🌐 API Testing

You can also test the API directly using curl:

```bash
# Set your Cloud Run URL
export APP_URL="https://your-service-url.a.run.app"

# Test the agent
curl -X POST $APP_URL/run_sse \
    -H "Content-Type: application/json" \
    -d '{
    "app_name": "stock-analyzer",
    "user_id": "user_123",
    "session_id": "session_abc",
    "new_message": {
        "role": "user",
        "parts": [{
        "text": "Analyze Tesla stock"
        }]
    },
    "streaming": false
    }'
```

## 📁 Project Structure for Deployment

```
Multi-Agent-Stock-Analyist/
├── agent.py              # Main orchestrator agent
├── main.py               # Cloud Run entry point
├── news_agent.py         # News analysis agent
├── historical_agent.py   # Historical analysis agent
├── economic_agent.py     # Economic analysis agent
├── political_agent.py    # Political analysis agent
├── cli.py               # CLI interface (for local testing)
├── requirements.txt     # Python dependencies
├── deploy.sh           # Deployment script
├── __init__.py         # Package initialization
└── DEPLOYMENT-GUIDE.md # This file
```

## 🔍 Troubleshooting

### Common Issues

#### 1. "Project not found"
```bash
gcloud projects list
gcloud config set project YOUR_ACTUAL_PROJECT_ID
```

#### 2. "Permission denied"
```bash
gcloud auth login
gcloud auth application-default login
```

#### 3. "API not enabled"
```bash
gcloud services enable run.googleapis.com artifactregistry.googleapis.com cloudbuild.googleapis.com aiplatform.googleapis.com
```

#### 4. "Agent not found"
- Ensure you're in the correct directory
- Check that `__init__.py` contains `from . import agent`
- Verify `agent.py` has `root_agent` defined

### Viewing Logs
```bash
gcloud run services logs read multi-agent-stock-analyzer --region=us-central1
```

### Updating the Service
```bash
# Redeploy with changes
./deploy.sh

# Or update environment variables
gcloud run services update multi-agent-stock-analyzer \
    --region=us-central1 \
    --set-env-vars="GOOGLE_GENAI_USE_VERTEXAI=True"
```

## 💰 Cost Optimization

- **Cloud Run**: Pay-per-request model, scales to zero when not in use
- **Vertex AI**: Pay per API call to Gemini models
- **Artifact Registry**: Minimal storage costs for container images

## 🔒 Security Considerations

- The service is deployed with public access (`--allow-unauthenticated`)
- For production, consider adding authentication
- API keys are not required when using Vertex AI
- All data processing happens within Google Cloud

## 📊 Monitoring

- View logs in Google Cloud Console
- Monitor API usage in Vertex AI console
- Set up alerts for errors or high usage

## 🎯 Next Steps

1. **Custom Domain**: Configure a custom domain for your service
2. **Authentication**: Add user authentication for production use
3. **Rate Limiting**: Implement rate limiting to prevent abuse
4. **Monitoring**: Set up comprehensive monitoring and alerting
5. **Scaling**: Configure auto-scaling based on demand

---

**Your Multi-Agent Stock Analyzer is now live on Google Cloud Run! 🚀**
