#!/bin/sh
. /tmp/set-env.sh

sudo docker rm -f $AXIS_SERVER_NAME
sudo docker rm -f wso2-esb-samples-as

#Creates a container 
sudo docker run -d --name wso2-esb-samples-as -v $WSO2_ESB_PATH \
 jgpelaez/wso2-esb /bin/bash

mkdir -p target

axis_server_pid=$(sudo docker run \
  -d  \
  --volumes-from wso2-esb-samples-as \
  --name $AXIS_SERVER_NAME \
  webratio/ant sh $WSO2_ESB_SAMPLES_PATH/axis2Server/axis2server.sh -name $AXIS_SERVER_NAME)
  
echo "container id". $axis_server_pid
sudo docker exec -d $axis_server_pid ant -f $WSO2_ESB_SAMPLES_PATH/axis2Server/src/SimpleStockQuoteService/build.xml
