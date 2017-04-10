#!/bin/bash

echo Starting at `date "+%F %T.%N"`

# -----------------------------------------------------------------------------
# Sets variables to use within script.
# -----------------------------------------------------------------------------

source variables.sh

# -----------------------------------------------------------------------------
# Cleans up tests
# -----------------------------------------------------------------------------

echo "======================== Stopping portal... ======================="

cat $LOG_DIR/liferay_pid.log | xargs kill -9

sleep 10s

echo "======================== Deleting portal... ======================="

rm -rf /opt/java/liferay/*

echo "======================= Dropping database... ======================"

mysql -e "drop database lportal;"

echo "============================= Done... ============================="

echo Finished at `date "+%F %T.%N"`
