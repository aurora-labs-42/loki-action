#!/bin/bash

set -e

JIRA_URL=$1
TO_REPO=$2
LABELS=$3
JQL=$4

# Get the latest tag from the GitHub releases
LATEST_TAG=$(curl --silent "https://api.github.com/repos/aurora-labs-42/loki/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')

# Download the JAR file
curl -L -o loki-dist.zip https://github.com/aurora-labs-42/loki/releases/download/${LATEST_TAG}/loki-${LATEST_TAG}-dist.zip
unzip loki-dist.zip

# Assuming the JAR file is named loki.jar inside the unzipped directory
java -jar quarkus-run.jar --from-jira=${JIRA_URL} --to-repo=${TO_REPO} --labels=${LABELS} --jql="${JQL}"
 

