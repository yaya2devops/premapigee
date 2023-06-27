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

for n ; do
   echo "Checking status on VM: $n ..." ;
   gcloud compute ssh "$n" -- 'apigee-all status ; echo -e "\n"' ;
done
