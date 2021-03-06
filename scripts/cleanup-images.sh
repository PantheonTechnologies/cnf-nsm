#!/usr/bin/env bash

IMAGE_REPO="$1"

source $(dirname $0)/labels.env
source $(dirname $0)/get-ligato-version.sh
VERSION="$(get_ligato_version)"

docker rmi ${IMAGE_REPO}/${CNF_CRD_IMAGE_LABEL}:latest
docker rmi ${IMAGE_REPO}/${VPP_PROD_IMAGE_LABEL}:${VERSION}
docker rmi ${IMAGE_REPO}/${LINUX_PROD_IMAGE_LABEL}:${VERSION}
docker image prune -f
