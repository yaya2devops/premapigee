# Apigee Lifecycle On-Premises Edition
Throughout this course of action, I implementated the Apigee API platform on a private cloud environment (5VMs). 

I handled tasks Incl. installation, upgrades and continuous monitoring.

I've also [previously built APIs](https://github.com/yaya2devops/translate-api#develop-and-secure-translate-apis) on the platform using the Google Cloud.

## Install Apigee 
- Setup Private cloud e.g [Google Compute Engine.](https://cloud.google.com/compute/)
- [Bootstrap utilities](install/install_utils_wrapper.sh)
- [Install Apigee services and cleanup](install/cleanup.sh)
- [Provision Apigee organization and environment](install/edge-response-setup-org.txt)

## Upgrade Apigee API
- Upgrade Apigee services
   - Upgrade the Cassandra and Zookeeper components
   - Upgrade Qpid and PostgreSQL components
   - Upgrade the OpenLDAP component
   - Upgrade the Apigee components
   - Upgrade the Apigee UI component
- Verify the upgrade
   - Verify service status and version
   - Validate service functionality
- Clean up test entities


## Monitoring and updates
- Verify status of Apigee services
   - on VM node-01
   - on VM node-02
   - on VM node-03
   - on VM node-04
   - on VM node-05
- Set up new components
   - Verify that apigee-setup is installed
   - Verify the configuration files
   - Set up the new message processor
   - Add the message processor to the prod environment
   - Verify component status
- Remove components
   - Unregister the message processor
   - Delete the server



### Methodology and conducted labs

- [On Premises Installation with Apigee API Platform](https://www.cloudskillsboost.google/public_profiles/664bbb5a-6ea0-4005-b3cf-817644fa9c0b/badges/4142314)
- [On Premises Management, Security, and Upgrade](https://www.cloudskillsboost.google/public_profiles/664bbb5a-6ea0-4005-b3cf-817644fa9c0b/badges/4143059)
- [On Premises Capacity Upgrade and Monitoring](https://www.cloudskillsboost.google/public_profiles/664bbb5a-6ea0-4005-b3cf-817644fa9c0b/badges/4143416)

