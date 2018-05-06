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

gcloud compute ssh ${VM_NAME}

At the GCE VM:
=====
        curl -sSL https://get.docker.com | sh
        sudo usermod -aG docker $USER
        sudo reboot
=====

glcoud compute  ssh ${VM_NAME}

=====
        docker pull jupyter/scipy-notebook
        docker run -p 8888:8888 -d jupyter/scipy-notebook
        docker exec -t $(docker ps -q) jupyter notebook list
        docker stats
=====

http://<public_ip>:8888/?token=<token>