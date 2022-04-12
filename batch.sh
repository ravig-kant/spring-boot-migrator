#
# Copyright 2022 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

processingFile=sbm-batch-commands.txt
javaCommand=...

# read input file with list of repos and branches coming from CSA
# github.com/foo/bar.git my-branch-name
# github.com/foo/maub.git main

# for each line

  # checkout repo
  git clone ...

  # switch branch
  cd ...
  git checkout $branch

  # run the mavne build and if it fails log and ignore this project
  mvn clean verify

  # analyze result of build and ignore or proceed

  # switch to a new branch (maybe?)
  git checkout -b mule-to-boot-migration

  # retrieve path to repo dir
  appDir=...

  # add to processing file
  echo "scan $appDir" >> $processingFile
  echo "apply initialize-spring-boot-migration" >> $processingFile
  echo "apply migrate-mule-to-boot" >> $processingFile

# end for
echo "exit" >> $processingFile


# run sbm
$javaCommand -jar spring-boot-migrator.jar @$processingFile

# TODO: check if running this in parallel works: https://www.cyberciti.biz/faq/how-to-run-command-or-code-in-parallel-in-bash-shell-under-linux-or-unix/
