#!/bin/sh
podman run -t -i -d --name go -v ~/.ssh/garden_id_rsa:/root/.ssh/id_rsa go
