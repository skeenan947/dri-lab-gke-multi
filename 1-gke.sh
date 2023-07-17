# gcloud beta container --project "qwiklabs-gcp-01-a6daf68b565e" clusters create "cymbal-gke-1" \
# --region "us-east1" --no-enable-basic-auth --cluster-version "1.26.5-gke.1200" \
# --release-channel "stable" --machine-type "e2-standard-4" --image-type "COS_CONTAINERD" \
# --disk-type "pd-balanced" --disk-size "100" --metadata disable-legacy-endpoints=true \
# --service-account "cymbal-gke-sa@qwiklabs-gcp-01-a6daf68b565e.iam.gserviceaccount.com" --num-nodes "1" \
# --logging=SYSTEM,WORKLOAD --monitoring=SYSTEM --enable-private-nodes --master-ipv4-cidr "172.17.0.0/28" \
# --enable-master-global-access --enable-ip-alias \
# --network "projects/qwiklabs-gcp-02-5618666c3d01/global/networks/cymbal-net" \
# --subnetwork "projects/qwiklabs-gcp-02-5618666c3d01/regions/us-central1/subnetworks/cymbal-tier-1" \
# --cluster-secondary-range-name "vpc-1-pods" --services-secondary-range-name "vpc-1-services" \
# --no-enable-intra-node-visibility --default-max-pods-per-node "110" --security-posture=standard \
# --workload-vulnerability-scanning=disabled --no-enable-master-authorized-networks \
# --addons HorizontalPodAutoscaling,HttpLoadBalancing,GcePersistentDiskCsiDriver --enable-autoupgrade \
# --enable-autorepair --max-surge-upgrade 1 --max-unavailable-upgrade 0 --no-enable-managed-prometheus \
# --workload-pool "qwiklabs-gcp-01-a6daf68b565e.svc.id.goog" --enable-shielded-nodes


# gcloud beta container --project "qwiklabs-gcp-01-a6daf68b565e" clusters create "cymbal-gke-2" \
# --region "us-central1" --no-enable-basic-auth --cluster-version "1.26.5-gke.1200" \
# --release-channel "stable" --machine-type "e2-standard-4" --image-type "COS_CONTAINERD" \
# --disk-type "pd-balanced" --disk-size "100" --metadata disable-legacy-endpoints=true \
# --service-account "cymbal-gke-sa@qwiklabs-gcp-01-a6daf68b565e.iam.gserviceaccount.com" --num-nodes "1" \
# --logging=SYSTEM,WORKLOAD --monitoring=SYSTEM --enable-private-nodes --master-ipv4-cidr "172.17.0.0/28" \
# --enable-master-global-access --enable-ip-alias \
# --network "projects/qwiklabs-gcp-02-5618666c3d01/global/networks/cymbal-net" \
# --subnetwork "projects/qwiklabs-gcp-02-5618666c3d01/regions/us-central1/subnetworks/cymbal-tier-2" \
# --cluster-secondary-range-name "vpc-2-pods" --services-secondary-range-name "vpc-2-services" \
# --no-enable-intra-node-visibility --default-max-pods-per-node "110" --security-posture=standard \
# --workload-vulnerability-scanning=disabled --no-enable-master-authorized-networks \
# --addons HorizontalPodAutoscaling,HttpLoadBalancing,GcePersistentDiskCsiDriver --enable-autoupgrade \
# --enable-autorepair --max-surge-upgrade 1 --max-unavailable-upgrade 0 --no-enable-managed-prometheus \
# --workload-pool "qwiklabs-gcp-01-a6daf68b565e.svc.id.goog" --enable-shielded-nodes



gcloud container fleet memberships register cymbal-gke-1 \
    --gke-cluster us-east1/cymbal-gke-1 \
    --enable-workload-identity \
    --project=qwiklabs-gcp-01-a6daf68b565e

gcloud container fleet memberships register cymbal-gke-2 \
    --gke-cluster us-central1/cymbal-gke-2 \
    --enable-workload-identity \
    --project=qwiklabs-gcp-01-a6daf68b565e


gcloud container fleet ingress enable \
    --config-membership=cymbal-gke-1 \
    --location=us-east1 \
    --project=qwiklabs-gcp-01-a6daf68b565e

