#!/bin/bash

# This script is used to setup Scala Environment

# Create the builder instance
docker buildx create --use

# Build the docker image for linux/amd64 and linux/arm64
docker buildx build --platform linux/amd64,linux/arm64 -t itsyourap/scala:latest --push .