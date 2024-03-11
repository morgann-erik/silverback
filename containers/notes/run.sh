#!/bin/sh
podman run -t -i -d --name notes -v ~/.ssh/garden_id_rsa:/root/.ssh/id_rsa notes
