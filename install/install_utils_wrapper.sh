#!/bin/bash

GCP_ZONE=

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

# get install script from cloud storage
gsutil cp gs://cloud-training/CBL318/install_utils.sh ~/install_utils.sh
if [ ! -f ~/install_utils.sh ]
then
   echo "Error: could not download install_utils.sh script. Exiting..."
   exit 1
fi
chmod a+x ~/install_utils.sh

# scp the script to all nodes
echo "Copying install_utils script to node-01..."
gcloud compute scp ~/install_utils.sh node-01:install_utils.sh
echo "Copying install_utils script to node-02..."
gcloud compute scp ~/install_utils.sh node-02:install_utils.sh
echo "Copying install_utils script to node-03..."
gcloud compute scp ~/install_utils.sh node-03:install_utils.sh
echo "Copying install_utils script to node-04..."
gcloud compute scp ~/install_utils.sh node-04:install_utils.sh
echo "Copying install_utils script to node-05..."
gcloud compute scp ~/install_utils.sh node-05:install_utils.sh

