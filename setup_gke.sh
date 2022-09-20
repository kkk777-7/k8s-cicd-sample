#!/bin/sh

export PROJECT_ID="cloudnative-cicd-kkk777"
export COMPUTE_ZONE="asia-northeast1-a"
export CLUSTER_VERSION="1.24.2-gke.1900"
export CLUSTER_NAME="cluster01"

gcloud config set project ${PROJECT_ID}
gcloud config set compute/zone ${COMPUTE_ZONE}

gcloud container clusters create ${CLUSTER_NAME} \
    --addons HttpLoadBalancing,HorizontalPodAutoscaling,NetworkPolicy \
    --cluster-version ${CLUSTER_VERSION} \
    --release-channel=regular \
    --image-type cos_containerd \
    --enable-autorepair \
    --machine-type=n1-standard-4 \
    --enable-autoscaling --min-nodes "3" --max-nodes "5" --num-nodes "3"