#!/bin/bash

# Define the container name
CONTAINER_NAME="code-os-debian-os-1"


# Get the container ID based on the container name
CONTAINER_ID=$(docker ps -qf "name=${CONTAINER_NAME}")

# Check if the container is running
if [ -z "$CONTAINER_ID" ]; then
  echo "Container ${CONTAINER_NAME} is not running."
  exit 1
fi

# Define the source and destination paths
SOURCE_PATH="/mnt/c/project_IHCP/dataset_ptrh_sin"


DEST_PATH="/home/linux/IHCPs/dataset_ptrh_sin_1000"

# Copy the dataset to the container
docker cp "${SOURCE_PATH}" "${CONTAINER_ID}:${DEST_PATH}"

# Check if the copy was successful
if [ $? -eq 0 ]; then
  echo "Dataset copied successfully to ${DEST_PATH} in container ${CONTAINER_NAME}."
else
  echo "Failed to copy dataset to container ${CONTAINER_NAME}."
  exit 1
fi