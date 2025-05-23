#!/bin/bash -u

# Copyright 2018 ConsenSys AG.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with
# the License. You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on
# an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the
# specific language governing permissions and limitations under the License.

NO_LOCK_REQUIRED=false

. ../../.env
source "$(dirname "$0")/common.sh"

removeDockerImage() {
  if [[ ! -z $(docker ps -a | grep $1) ]]; then
    docker image rm $1
  fi
}

echo "*************************************"
echo "Localnet"
echo "*************************************"
echo "Stop and remove network..."

docker compose -f ../../docker-compose.yml -f $BLOCKSCOUT_DOCKER_CONFIG --profile services down -v
docker compose -f ../../docker-compose.yml -f $BLOCKSCOUT_DOCKER_CONFIG --profile services rm -sfv

rm -rf $BLOCKSCOUT_CONFIGS_DIR/services/blockscout-db-data
rm -rf $BLOCKSCOUT_CONFIGS_DIR/services/redis-data
rm -rf $BLOCKSCOUT_CONFIGS_DIR/services/stats-db-data

rm ${LOCK_FILE}
echo "Lock file ${LOCK_FILE} removed"
