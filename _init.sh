#!/bin/bash

#********************************************************************************
# Copyright 2014 IBM
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#********************************************************************************

#############
# Colors    #
#############
export green='\e[0;32m'
export red='\e[0;31m'
export label_color='\e[0;33m'
export no_color='\e[0m' # No Color

##################################################
# Simple function to only run command if DEBUG=1 # 
### ###############################################
debugme() {
  [[ $DEBUG = 1 ]] && "$@" || :
}

export -f debugme 

if [[ $DEBUG = 1 ]]; then 
    export ICE_ARGS="--verbose"
else
    export ICE_ARGS=""
fi 

export LOG_DIR=$EXT_DIR

set +e
set +x 

if [ "${TEST}" == "inventory" ]; then
    IDS_INV_URL="${IDS_URL%/}"
    IDS_REQUEST=$TASK_ID
    IDS_DEPLOYER=${JOB_NAME##*/}
    if [ ! -z "$COPYARTIFACT_BUILD_NUMBER" ] ; then
        IDS_VERSION_TYPE="JENKINS_BUILD_ID"
        IDS_VERSION=$COPYARTIFACT_BUILD_NUMBER
    elif [ ! -z "$CS_BUILD_SELECTOR" ] ; then
        IDS_VERSION_TYPE="JENKINS_BUILD_ID"
        IDS_VERSION=$CS_BUILD_SELECTOR
    else
            IDS_VERSION_TYPE="SCM_REV_ID"
        if [ ! -z "$GIT_COMMIT" ] ; then
            IDS_VERSION=$GIT_COMMIT
        elif [ ! -z "$RTCBuildResultUUID" ] ; then
            IDS_VERSION=$RTCBuildResultUUID
        fi
    fi
    IDS_RESOURCE=$CF_SPACE_ID
    IDS_STATUS="8ff04768-215e-4ca5-936d-295bf3acf4f8"
    echo "bash ids-inv -a insert -d $IDS_DEPLOYER -q $IDS_REQUEST -r $IDS_RESOURCE -s $IDS_STATUS -t ibm_containers -u $IDS_INV_URL -v $IDS_VERSION"
    bash ids-inv -a insert -d $IDS_DEPLOYER -q $IDS_REQUEST -r $IDS_RESOURCE -s $IDS_STATUS -t ibm_containers -u $IDS_INV_URL -v $IDS_VERSION
    exit 0
elif [[ "${TEST}" == "inventorygroup" ]]; then
    IDS_INV_URL="${IDS_URL%/}"
    IDS_REQUEST=$TASK_ID
    IDS_DEPLOYER=${JOB_NAME##*/}
    if [ ! -z "$COPYARTIFACT_BUILD_NUMBER" ] ; then
        IDS_VERSION_TYPE="JENKINS_BUILD_ID"
        IDS_VERSION=$COPYARTIFACT_BUILD_NUMBER
    elif [ ! -z "$CS_BUILD_SELECTOR" ] ; then
        IDS_VERSION_TYPE="JENKINS_BUILD_ID"
        IDS_VERSION=$CS_BUILD_SELECTOR
    else
            IDS_VERSION_TYPE="SCM_REV_ID"
        if [ ! -z "$GIT_COMMIT" ] ; then
            IDS_VERSION=$GIT_COMMIT
        elif [ ! -z "$RTCBuildResultUUID" ] ; then
            IDS_VERSION=$RTCBuildResultUUID
        fi
    fi
    IDS_RESOURCE=$CF_SPACE_ID
    IDS_STATUS="de2e78c2-b31e-4fb4-9869-925af799bb5c"
    echo "bash ids-inv -a insert -d $IDS_DEPLOYER -q $IDS_REQUEST -r $IDS_RESOURCE -s $IDS_STATUS -t ibm_containers_group -u $IDS_INV_URL -v $IDS_VERSION"
    bash ids-inv -a insert -d $IDS_DEPLOYER -q $IDS_REQUEST -r $IDS_RESOURCE -s $IDS_STATUS -t ibm_containers_group -u $IDS_INV_URL -v $IDS_VERSION
    exit 0
elif [[ "${TEST}" == "inventorystaging" ]]; then
    IDS_INV_URL="${IDS_URL%/}"
    IDS_REQUEST=$TASK_ID
    IDS_DEPLOYER=${JOB_NAME##*/}
    if [ ! -z "$COPYARTIFACT_BUILD_NUMBER" ] ; then
        IDS_VERSION_TYPE="JENKINS_BUILD_ID"
        IDS_VERSION=$COPYARTIFACT_BUILD_NUMBER
    elif [ ! -z "$CS_BUILD_SELECTOR" ] ; then
        IDS_VERSION_TYPE="JENKINS_BUILD_ID"
        IDS_VERSION=$CS_BUILD_SELECTOR
    else
            IDS_VERSION_TYPE="SCM_REV_ID"
        if [ ! -z "$GIT_COMMIT" ] ; then
            IDS_VERSION=$GIT_COMMIT
        elif [ ! -z "$RTCBuildResultUUID" ] ; then
            IDS_VERSION=$RTCBuildResultUUID
        fi
    fi
    IDS_RESOURCE=$CF_SPACE_ID
    IDS_STATUS="ddc7a3ef-c4a2-401a-b6d9-935bef09f316"
    echo "bash ids-inv -a insert -d $IDS_DEPLOYER -q $IDS_REQUEST -r $IDS_RESOURCE -s $IDS_STATUS -t ibm_containers -u $IDS_INV_URL -v $IDS_VERSION"
    bash ids-inv -a insert -d $IDS_DEPLOYER -q $IDS_REQUEST -r $IDS_RESOURCE -s $IDS_STATUS -t ibm_containers -u $IDS_INV_URL -v $IDS_VERSION
    exit 0
elif [[ "${TEST}" == "inventorygroupstaging" ]]; then
    IDS_INV_URL="${IDS_URL%/}"
    IDS_REQUEST=$TASK_ID
    IDS_DEPLOYER=${JOB_NAME##*/}
    if [ ! -z "$COPYARTIFACT_BUILD_NUMBER" ] ; then
        IDS_VERSION_TYPE="JENKINS_BUILD_ID"
        IDS_VERSION=$COPYARTIFACT_BUILD_NUMBER
    elif [ ! -z "$CS_BUILD_SELECTOR" ] ; then
        IDS_VERSION_TYPE="JENKINS_BUILD_ID"
        IDS_VERSION=$CS_BUILD_SELECTOR
    else
            IDS_VERSION_TYPE="SCM_REV_ID"
        if [ ! -z "$GIT_COMMIT" ] ; then
            IDS_VERSION=$GIT_COMMIT
        elif [ ! -z "$RTCBuildResultUUID" ] ; then
            IDS_VERSION=$RTCBuildResultUUID
        fi
    fi
    IDS_RESOURCE=$CF_SPACE_ID
    IDS_STATUS="c639c12f-0821-419f-bdc7-38ee304313e3"
    echo "bash ids-inv -a insert -d $IDS_DEPLOYER -q $IDS_REQUEST -r $IDS_RESOURCE -s $IDS_STATUS -t ibm_containers_group -u $IDS_INV_URL -v $IDS_VERSION"
    bash ids-inv -a insert -d $IDS_DEPLOYER -q $IDS_REQUEST -r $IDS_RESOURCE -s $IDS_STATUS -t ibm_containers_group -u $IDS_INV_URL -v $IDS_VERSION
    exit 0
fi 
###############################
# Configure extension PATH    #
###############################
if [ -n $EXT_DIR ]; then 
    export PATH=$EXT_DIR:$PATH
fi 

######################
# Install ICE CLI    #
######################
echo "installing ICE CLI"
ice help &> /dev/null
RESULT=$?
if [ $RESULT -ne 0 ]; then
    pushd . 
    cd $EXT_DIR
    sudo apt-get update &> /dev/null
    sudo apt-get -y install python2.7 &> /dev/null
    python --version 
    python get-pip.py --user &> /dev/null
    export PATH=$PATH:~/.local/bin
    pip install --user icecli-2.0.zip
    ice help &> /dev/null
    RESULT=$?
    if [ $RESULT -ne 0 ]; then
        echo -e "${red}Failed to install IBM Container Service CLI ${no_color}"
        debugme python --version
        exit $RESULT
    fi
    popd 
    echo -e "${label_color}Successfully installed IBM Container Service CLI ${no_color}"
fi

#############################
# Install Cloud Foundry CLI #
#############################
echo "Installing Cloud Foundry CLI"
pushd . 
cd $EXT_DIR 
gunzip cf-linux-amd64.tgz &> /dev/null
tar -xvf cf-linux-amd64.tar  &> /dev/null
cf help &> /dev/null
RESULT=$?
if [ $RESULT -ne 0 ]; then
    echo -e "${red}Could not install the cloud foundry CLI ${no_color}"
    exit 1
fi  
popd
echo -e "${label_color}Successfully installed Cloud Foundry CLI ${no_color}"

#################################
# Set Bluemix Host Information  #
#################################
if [ -n "$BLUEMIX_TARGET" ]; then
    if [ "$BLUEMIX_TARGET" == "staging" ]; then 
        debugme echo "targetting staging environment"
        export CCS_API_HOST="api-ice.stage1.ng.bluemix.net" 
        export CCS_REGISTRY_HOST="registry-ice.stage1.ng.bluemix.net"
        export BLUEMIX_API_HOST="api.stage1.ng.bluemix.net"
        export ICE_CFG="ice-cfg-staging.ini"

    elif [ "$BLUEMIX_TARGET" == "prod" ]; then 
        debugme echo -e "Targetting production Bluemix"
        export CCS_API_HOST="api-ice.ng.bluemix.net" 
        export CCS_REGISTRY_HOST="registry-ice.ng.bluemix.net"
        export BLUEMIX_API_HOST="api.ng.bluemix.net"
        export ICE_CFG="ice-cfg-prod.ini"

    else 
        echo -e "${red}Unknown Bluemix environment specified"
        exit 1
    fi 
else 
    echo -e "Targetting production Bluemix"
    export CCS_API_HOST="api-ice.ng.bluemix.net" 
    export CCS_REGISTRY_HOST="registry-ice.ng.bluemix.net"
    export BLUEMIX_API_HOST="api.ng.bluemix.net"
    export ICE_CFG="ice-cfg-prod.ini"

fi  


################################
# Login to Container Service   #
################################
debugme echo "BLUEMIX_TARGET: $BLUEMIX_TARGET"
if [ -n "$API_KEY" ]; then 
    echo -e "${label_color}Logging on with API_KEY${no_color}"
    debugme echo "Login command: ice $ICE_ARGS login --key ${API_KEY}"
    #ice $ICE_ARGS login --key ${API_KEY} --host ${CCS_API_HOST} --registry ${CCS_REGISTRY_HOST} --api ${BLUEMIX_API_HOST} 
    ice $ICE_ARGS login --key ${API_KEY}
    RESULT=$?
elif [ -n "$BLUEMIX_TARGET" ] || [ ! -f ~/.cf/config.json ]; then
    # need to gather information from the environment 
    # Get the Bluemix user and password information 
    if [ -z "$BLUEMIX_USER" ]; then 
        echo -e "${red} Please set BLUEMIX_USER on environment ${no_color} "
        exit 1
    fi 
    if [ -z "$BLUEMIX_PASSWORD" ]; then 
        echo -e "${red} Please set BLUEMIX_PASSWORD as an environment property environment ${no_color} "
        exit 1 
    fi 
    if [ -z "$BLUEMIX_ORG" ]; then 
        export BLUEMIX_ORG=$BLUEMIX_USER
        echo -e "${label_color} Using ${BLUEMIX_ORG} for Bluemix organization, please set BLUEMIX_ORG if on the environment if you wish to change this. ${no_color} "
    fi 
    if [ -z "$BLUEMIX_SPACE" ]; then
        export BLUEMIX_SPACE="dev"
        echo -e "${label_color} Using ${BLUEMIX_SPACE} for Bluemix space, please set BLUEMIX_SPACE if on the environment if you wish to change this. ${no_color} "
    fi 
    echo -e "${label_color}Targetting information.  Can be updated by setting environment variables${no_color}"
    echo "BLUEMIX_USER: ${BLUEMIX_SPACE}"
    echo "BLUEMIX_SPACE: ${BLUEMIX_SPACE}"
    echo "BLUEMIX_ORG: ${BLUEMIX_ORG}"
    echo "BLUEMIX_PASSWORD: xxxxx"
    echo ""
    echo -e "${label_color}Logging in to Bluemix and IBM Container Service using environment properties${no_color}"
    debugme echo "login command: ice $ICE_ARGS login --cf --host ${CCS_API_HOST} --registry ${CCS_REGISTRY_HOST} --api ${BLUEMIX_API_HOST} --user ${BLUEMIX_USER} --psswd ${BLUEMIX_PASSWORD} --org ${BLUEMIX_ORG} --space ${BLUEMIX_SPACE}"
    ice $ICE_ARGS login --cf --host ${CCS_API_HOST} --registry ${CCS_REGISTRY_HOST} --api ${BLUEMIX_API_HOST} --user ${BLUEMIX_USER} --psswd ${BLUEMIX_PASSWORD} --org ${BLUEMIX_ORG} --space ${BLUEMIX_SPACE} 
    RESULT=$?
else 
    # we are already logged in.  Simply check via ice command 
    echo -e "${label_color}Logging into IBM Container Service using credentials passed from IBM DevOps Services ${no_color}"
    mkdir -p ~/.ice
    echo "Copying ${EXT_DIR}/${ICE_CFG}"
    debugme more "${EXT_DIR}/${ICE_CFG}"
    cp ${EXT_DIR}/${ICE_CFG} ~/.ice/ice-cfg.ini

    debugme more ~/.ice/ice-cfg.ini
    debugme more ~/.cf/config.json

    ice --verbose ps > ps.log 
    debugme cat ps.log 
    RESULT=$?
    if [ $RESULT -ne 0 ]; then
        echo "checking login to registry server" 
        ice images &> /dev/null
        RESULT=$? 
    fi 
fi 

# check login result 
if [ $RESULT -eq 1 ]; then
    echo -e "${red}Failed to login to IBM Container Service${no_color}"
    exit $RESULT
else 
    echo -e "${green}Successfully logged into IBM Container Service${no_color}"
    ice info 
fi 

##############################
# Identify the Image to use  #
##############################
# If the IMAGE_NAME is set in the environment then use that.  
# Else assume the input is coming from the build.properties created and archived by the Docker builder job
if [ -z $IMAGE_NAME ]; then
    debugme "finding build.properties"
    debugme pwd 
    debugme ls

    if [ -f build.properties ]; then
        . build.properties 
        export IMAGE_NAME
        debugme cat build.properties
        echo "IMAGE_NAME: $IMAGE_NAME"
    fi  
    if [ -z $IMAGE_NAME ]; then
        echo -e "${red}IMAGE_NAME not set.  Set the IMAGE_NAME in the environment or provide a Docker build job as input to this deploy job ${no_label}"
        exit 1
    fi 
else 
    echo -e "${label_color}Image being overridden by the environment.  Using ${IMAGE_NAME} ${no_color}"
fi 

########################
# Current Limitations  #
########################
if [ -z $IP_LIMIT ]; then 
    export IP_LIMIT=8
fi 
if [ -z $CONTAINER_LIMIT ]; then 
    export CONTAINER_LIMIT=8
fi 
sudo apt-get install bc &> /dev/null

echo -e "${label_color}Initialization complete ${no_color}"

