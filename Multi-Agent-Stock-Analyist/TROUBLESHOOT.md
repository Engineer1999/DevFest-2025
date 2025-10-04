### Activate necessary Services
```
gcloud projects add-iam-policy-binding PROJECT_ID \
--member="serviceAccount:PROJECT_NUMBER-compute@developer.gserviceaccount.com" \
--role="roles/run.admin"

gcloud projects add-iam-policy-binding PROJECT_ID \
--member="serviceAccount:PROJECT_NUMBER-compute@developer.gserviceaccount.com" \
--role="roles/cloudbuild.builds.builder"

gcloud projects add-iam-policy-binding PROJECT_ID \
--member="serviceAccount:PROJECT_NUMBER-compute@developer.gserviceaccount.com" \
--role="roles/iam.serviceAccountUser"
```

### gcloud sdk not found
#### Most common default
```
ls $HOME/google-cloud-sdk/bin/gcloud
```

#### Append one line, adjusting the path if your SDK lives elsewhere:
```
export PATH="$HOME/google-cloud-sdk/bin:$PATH"
```

#### Apply the change:
```
source ~/.bashrc        # or source ~/.zshrc
```

#### Test:
```
gcloud --version
```
