#!/usr/bin/env bash

export PROJECT_HOME="$(cd "`dirname $(readlink -nf "$0")`"/..; pwd -P)"

delay=5

# ------------------------------------------------   Common Methods   ------------------------------------------------ #

showUsage()
{
    echo "$0 submit-eso"
    echo "$0 kill-eso"
    echo "$0 resubmit-eso"
}

# ------------------------------------------------    Major Methods   ------------------------------------------------ #

submitEso()
{
    spark-submit \
      --class "com.accenture.MyWrodCount" \
      --master local[4] \
      ../lib/${project.artifactId}-${project.version}.jar file:///home/eso/test.sh
    echo "Topology: ${topology.exclamation.name} is started."
}

killEso()
{
    storm kill ${topology.eso.name} -w 0
    echo "Topology: ${topology.exclamation.name} is stopped."
}

# -----------------------------------------------   Shell Scripts Entry   -------------------------------------------- #

case $1 in
    (submit-eso)
        submitEso
    ;;
    (kill-eso)
        killEso
    ;;
    (resubmit-eso)
        killEso
        sleep $delay
        submitEso
    ;;
    (*)
        showUsage
    ;;
esac