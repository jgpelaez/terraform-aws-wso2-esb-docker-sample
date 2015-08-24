#!/bin/sh
. ./set-env.sh

WSO_ESB_SAMPLES_SERVER_NAME=$1

export CLIENT_ARGUMENTS="-Daddurl=http://$AXIS_SERVER_NAME:9000/services/SimpleStockQuoteService \
   -Dtrpurl=http://$WSO_ESB_SAMPLES_SERVER_NAME/"
   	
echo Running wso2 client sample with arguments: $CLIENT_ARGUMENTS

docker rm -f wso2-esb-samples-client
#Creates a container 
docker run -d --name wso2-esb-samples-client -v $WSO2_ESB_PATH \
 jgpelaez/wso2-esb /bin/bash

docker run \
  --volumes-from wso2-esb-samples-client \
  webratio/ant ant stockquote -f $WSO2_ESB_SAMPLES_ClIENT_BUILD \
   $CLIENT_ARGUMENTS