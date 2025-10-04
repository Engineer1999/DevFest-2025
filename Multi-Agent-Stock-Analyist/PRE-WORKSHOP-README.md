# Pre-Workshop Preparation Guide
## Google ADK Multi-Agent Stock Analyzer Workshop

### 🎯 Workshop Overview
In this hands-on workshop, you'll learn to build and deploy a multi-agent system using Google's Agent Development Kit (ADK). We'll create a stock analysis system with specialized agents and deploy it to Google Cloud Run for public access.

---

## 📋 Prerequisites Checklist

### ✅ Required Accounts & Access
- [ ] **Google Cloud Platform Account** with billing enabled (This will be provided during workshop)
- [ ] **GitHub Account** (for code access)

### ✅ Development Environment Setup

#### 1. **Install Python 3.9+**
```bash
# Check your Python version
python --version
# or
python3 --version
```
- **Windows**: Download from [python.org](https://python.org)
- **macOS**: `brew install python` or download from python.org
- **Linux**: `sudo apt install python3 python3-pip` (Ubuntu/Debian)

#### 2. **Install Google Cloud CLI**
```bash
# Download and install from: https://cloud.google.com/sdk/docs/install
# Verify installation
gcloud --version
```

#### 3. **Install Docker**
- **Windows**: Download [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- **macOS**: Download [Docker Desktop](https://www.docker.com/products/docker-desktop/) or `brew install --cask docker`
- **Linux**: 
  ```bash
  # Ubuntu/Debian
  sudo apt update
  sudo apt install docker.io
  sudo systemctl start docker
  sudo systemctl enable docker
  sudo usermod -aG docker $USER
  # Log out and back in for group changes to take effect
  ```

#### 4. **Install ADK and Dependencies**
```bash
# Create a virtual environment (recommended)
python -m venv adk-workshop
source adk-workshop/bin/activate  # On Windows: adk-workshop\Scripts\activate

# Install required packages
pip install google-adk google-generativeai python-dotenv
```

#### 5. **Verify Your Setup**
```bash
# Test Docker installation
docker --version
docker run hello-world

# Test ADK installation
adk --version

# Test gcloud CLI
gcloud --version
```

--------
--------
## 🛠️ Workshop Agenda Preview

### **Part 1: Understanding Multi-Agent Systems**
- Introduction to Google ADK
- Agent architecture and design patterns
- Tool integration and agent communication

### **Part 2: Building the Stock Analyzer**
- News Agent: Real-time market information
- Historical Agent: Price trend analysis
- Economic Agent: Macroeconomic factors
- Political Agent: Regulatory environment
- Root Agent: Orchestration and synthesis

### **Part 3: Deployment to Cloud Run**
- Containerization with Docker
- Cloud Run configuration
- Public URL deployment
- Experiments

---

## 🚀 Deployment Steps

### **Environment Variables Setup**
Before deploying, you'll need to set up the following environment variables:

```bash
# Set your Google Cloud project ID
export GOOGLE_CLOUD_PROJECT="your-project-id"

# Set your preferred region
export GOOGLE_CLOUD_LOCATION="us-central1"

# Set your service name
export SERVICE_NAME="stock-analyzer-service"

# Set your app name
export APP_NAME="stock-analyzer"

# Set the path to your agent file
export AGENT_PATH="./agent.py"
```

### **Deploy to Cloud Run**
Use the following command to deploy your multi-agent stock analyzer to Google Cloud Run:

```bash
sudo adk deploy cloud_run \
--project=$GOOGLE_CLOUD_PROJECT \
--region=$GOOGLE_CLOUD_LOCATION \
--service_name=$SERVICE_NAME \
--app_name=$APP_NAME \
--with_ui \
$AGENT_PATH
```

### **Post-Deployment**
After successful deployment:
1. You'll receive a public URL for your deployed service
2. The `--with_ui` flag enables a web interface for easy interaction
3. Test your deployment by accessing the provided URL
4. Monitor your service in the Google Cloud Console

---

## 📚 Recommended Reading (Optional)

### **Google ADK Documentation**
- [ADK Quickstart](https://google.github.io/adk-docs/get-started/quickstart/)
- [Agent Development Guide](https://google.github.io/adk-docs/agents/)
- [Cloud Run Deployment](https://google.github.io/adk-docs/deploy/cloud-run/)

### **Multi-Agent Systems Concepts**
- Agent-based modeling principles
- Tool integration patterns
- Orchestration strategies

---

## 🎯 What You'll Build

By the end of this workshop, you'll have:
- ✅ A fully functional multi-agent stock analysis system
- ✅ Deployed application accessible via public URL
- ✅ Understanding of Google ADK architecture
- ✅ Hands-on experience with Cloud Run deployment
- ✅ Knowledge to build your own agent systems

---

**Ready to build the future of AI agents? Let's get started! 🚀**