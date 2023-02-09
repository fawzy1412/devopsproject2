#!/bin/bash
docker images|grep -i demo| awk '{print $1":"$2}'| xargs docker rmi -f
