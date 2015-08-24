#!/bin/sh

curl -sSL https://get.docker.com/ | sh

sudo usermod -aG docker ubuntu
echo added user to docker group
#newgrp