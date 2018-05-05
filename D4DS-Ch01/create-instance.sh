#!/usr/bin/env bash
VM_NAME=$1

#gcloud compute instances create ${VM_NAME} \
#  --tags ${VM_NAME} \
#  --machine-type f1-micro \
#  --image=ubuntu-1604-xenial-v20180424 \
#  --image-project=ubuntu-os-cloud \
#  --boot-disk-size=20GB \
#  --boot-disk-type=pd-ssd \
#  --boot-disk-device-name=${VM_NAME}

gcloud compute firewall-rules create ${VM_NAME}-fw-rules \
    --allow tcp:80,tcp:443,tcp:2376,tcp:8888 \
    --target-tags ${VM_NAME}

