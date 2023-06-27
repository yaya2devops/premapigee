#!/bin/bash

GCP_ZONE=<VMs-ZONE

# remove unnecessary files from the installation nodes
# ---  Validate environment variables
function checkZone(){
 GCP_ZONE=$(gcloud config get-value compute/zone)

 if [ -z "$GCP_ZONE" ]
 then
    echo "Error: compute zone is not set. Exiting..."
    exit 1
 fi
}

# Call the function to validate the environment
checkZone

# clean all nodes
echo "Cleaning node-01..."
gcloud compute ssh node-01 -- 'sudo rm /opt/apigee/apigee-machinekey/lib/machinekey.jar'
echo "Cleaning node-02..."
gcloud compute ssh node-02 -- 'sudo rm /opt/apigee/apigee-machinekey/lib/machinekey.jar'
echo "Cleaning node-03..."
gcloud compute ssh node-03 -- 'sudo rm /opt/apigee/apigee-machinekey/lib/machinekey.jar'
echo "Cleaning node-04..."
gcloud compute ssh node-04 -- 'sudo rm /opt/apigee/apigee-machinekey/lib/machinekey.jar'
echo "Cleaning node-05..."
gcloud compute ssh node-05 -- 'sudo rm /opt/apigee/apigee-machinekey/lib/machinekey.jar'
