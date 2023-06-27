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
gsutil cp gs://cloud-training/CBL319/upgrade_utils.sh ~/upgrade_utils.sh
if [ ! -f ~/upgrade_utils.sh ]
then
   echo "Error: could not download upgrade_utils.sh script. Exiting..."
   exit 1
fi
chmod a+x ~/upgrade_utils.sh

# scp the script to all nodes
#echo "Copying upgrade_utils script to node-01..."
#gcloud compute scp ~/upgrade_utils.sh node-01:upgrade_utils.sh

for i in {2..5} ; do
   echo "Bootstrapping node-0$i..." ;
   gcloud compute ssh "node-0$i" -- 'bash -s' < ./upgrade_utils.sh ;
done

