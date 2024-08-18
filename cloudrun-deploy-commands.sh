# Grant the necessary permissions to the cloud run Service Account : 
gcloud projects add-iam-policy-binding 1090925531874 \
  --member serviceAccount:1090925531874-compute@developer.gserviceaccount.com  \
  --role='roles/aiplatform.admin'

# Step-1
docker build -t credit-scoring-assessment .
# Push to Container Registry 
docker tag credit-scoring-assessment gcr.io/skatsushi/credit-scoring-assessment
docker push gcr.io/skatsushi/credit-scoring-assessment

gcloud run deploy credit-scoring-assessment --image  gcr.io/skatsushi/credit-scoring-assessment --region us-central1