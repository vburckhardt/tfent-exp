#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status
set -o pipefail  # Catch errors in pipelines

# Define variables
IBM_CLOUD_CLI_VERSION="2.33.1"
IBM_CLOUD_CLI_URL="https://download.clis.cloud.ibm.com/ibm-cloud-cli/${IBM_CLOUD_CLI_VERSION}/binaries/IBM_Cloud_CLI_${IBM_CLOUD_CLI_VERSION}_linux_amd64.tgz"
INSTALL_DIR="${pwd}/ibmcloud-cli"

# Download binary
echo "Downloading IBM Cloud CLI version ${IBM_CLOUD_CLI_VERSION}..."
wget -q "${IBM_CLOUD_CLI_URL}" -O IBM_Cloud_CLI.tgz

# Extract binary
echo "Extracting IBM Cloud CLI..."
tar -xvf IBM_Cloud_CLI.tgz

# Move the binary to the installation directory
echo "Installing IBM Cloud CLI to ${INSTALL_DIR}..."
mkdir -p "${INSTALL_DIR}"
mv IBM_Cloud_CLI/ibmcloud "${INSTALL_DIR}"

# Make the binary executable
chmod +x "${INSTALL_DIR}/ibmcloud"

# Clean up
echo "Cleaning up..."
rm -f IBM_Cloud_CLI.tgz
rm -rf ibmcloud
rm -rf IBM_Cloud_CLI

PATH="${INSTALL_DIR}":$PATH

# Test the installation
echo "Testing IBM Cloud CLI installation..."
ibmcloud --version

# Install plugins
echo "Installing IBM Cloud CLI plugins..."
ibmcloud plugin install container-service -f
ibmcloud plugin install container-registry -f
ibmcloud plugin install kubernetes-service -f

echo "IBM Cloud CLI installation and setup completed successfully."



