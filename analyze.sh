#!/bin/bash
export CMAKE_EXPORT_COMPILE_COMMANDS=1
./juliet.py --all --clean
./juliet.py --all --configure
./merge_compdb.sh
sonar-scanner \
  -Dsonar.organization=geoffray-adde-sonarsource-github \
  -Dsonar.projectKey=geoffray-adde-sonarsource_juliet-test-suite-c \
  -Dsonar.sources=testcases \
  -Dsonar.scm.disabled=True \
  -Dsonar.cpd.exclusions=** \
  -Dsonar.inclusions=**.c,**.h,**.cpp \
  -Dsonar.exclusions=**/CMake*.c* \
  -Dsonar.cfamily.compile-commands=compile_commands.json \
  -Dsonar.cfamily.analysisCache.mode=fs \
  -Dsonar.cfamily.analysisCache.path=./analysis_cache/ \
  -Dsonar.login=$SONARQUBE_LOGIN \
  -Dsonar.host.url=https://sonarcloud.io
