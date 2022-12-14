#!/usr/bin/env sh

docker push rebornos/rebornos:latest-arm64

docker manifest rm rebornos/rebornos:latest || true

docker manifest create \
    rebornos/rebornos:latest \
    --amend rebornos/rebornos:latest-amd64 \
    --amend rebornos/rebornos:latest-arm64

docker manifest push rebornos/rebornos:latest