#!/usr/bin/env bash


spark-submit \
  --class "com.accenture.MyWrodCount" \
  --master local[4] \
  ../lib/${project.artifactId}-${project.version}.jar file:///home/eso/test.sh