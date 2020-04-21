#!/usr/bin/env bash
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# NOTE: Include this as a job in the job-templates.yml like this
#
#   - script: ./tools/ci/install-snapshot-shaded.sh https://github.com/rmetzger/flink-shaded.git FLINK-11086-hadoop3
#    displayName: "Prepare flink-shaded"


REPO=$1
BRANCH=$2

pwd
ls -lisah

CI_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo $CI_DIR
source $CI_DIR/maven_utils.sh

git clone $REPO
cd flink-shaded
git checkout $BRANCH
run_mvn install -Dhadoop.two.version=2.4.1 -Dhadoop.three.version=3.1.3
run_mvn install -Dhadoop.two.version=2.6.5 -Dhadoop.three.version=3.0.3
run_mvn install -Dhadoop.two.version=2.7.5
run_mvn install -Dhadoop.two.version=2.8.3
run_mvn install -Dhadoop.two.version=3.1.3