#!/bin/bash

USER=
PWD=

# move edge-response.txt from home dir if exists
if [ -f ~/edge-response.txt ]
then
   sudo mv ~/edge-response.txt /tmp/apigee
fi

export UPGRADE_VER=$(curl -s https://storage.googleapis.com/cloud-training/CBL319/upgrade_opdk_version.txt?ignoreCache=1)
if [ -z "$UPGRADE_VER" ]
then
   UPGRADE_VER="4.50.00"
fi

# download bootstrap script
sudo curl -s https://software.apigee.com/bootstrap_${UPGRADE_VER}.sh -o /tmp/apigee/bootstrap_${UPGRADE_VER}.sh
if [ -f /tmp/apigee/bootstrap_${UPGRADE_VER}.sh ]
then
   echo "Bootstrap script downloaded."
fi

# read username and password from credentials file
if [ -f /tmp/apigee/credentials.txt ]
then
   USER=$(grep -i '^User' /tmp/apigee/credentials.txt | cut -d":" -f2 | sed -E 's/^[[:space:]]+|[[:space:]]+$//g')
   PWD=$(grep -i '^Password' /tmp/apigee/credentials.txt | cut -d":" -f2 | sed -E 's/^[[:space:]]+|[[:space:]]+$//g')
fi

# run bootstrap script
sudo bash /tmp/apigee/bootstrap_${UPGRADE_VER}.sh apigeeuser=$USER apigeepassword=$PWD

# verify execution
sudo cat /etc/yum.repos.d/apigee.repo
sudo yum -v repolist 'apigee*'
sudo rpm -qa | egrep "(apigee-|edge-)"

# update apigee-setup utility
/opt/apigee/apigee-service/bin/apigee-service apigee-setup update
if [ ! -d /opt/apigee/apigee-setup-${UPGRADE_VER}* ]
then
  echo "Error in update the apigee-setup utility. Exiting..."
  exit 1
fi

# update the apigee-adminapi utility
/opt/apigee/apigee-service/bin/apigee-service apigee-adminapi update

echo "...Upgraded bootstrap script and apigee utlities."

