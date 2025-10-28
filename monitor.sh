#!/bin/bash

LOG_DIR=data_pipeline_linux/logs
SUMMARY_LOG=$LOG_DIR/monitor_summary.log

echo "[$(date)] Starting log monitoring....." >> $SUMMARY_LOG

ERRORS=$(grep -i "ERROR" $LOG_DIR/*.log)

if [ -n "$ERRORS" ]; then
    echo "[$(date)] Error found during pipeline execution:" >> $SUMMARY_LOG
    echo "$ERRORS" >> $SUMMARY_LOG
    echo "Errors detected! Check  $SUMMARY_LOG for details."
else
    echo "[$(date)] No errors found in the logs." >> $SUMMARY_LOG
    echo "No errors detected."
fi