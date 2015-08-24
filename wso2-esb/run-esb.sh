#!/bin/sh
. /tmp/set-env.sh

sudo docker rm -f wso2-esb-samples

sudo docker build -t jgpelaez/wso2-esb-samples ../utils/esb/

sudo docker run  \
	-d  \
	-p 443:9443 -p 80:8280 \
	-v $WSO2_ESB_PATH \
	--link wso2-esb-samples-axis-server:wso2-esb-samples-axis-server \
	--name wso2-esb-samples \
	jgpelaez/wso2-esb $WSO2_ESB_PATH/bin/wso2esb-samples.sh -sn 0
	