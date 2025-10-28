#!/bin/bash

#Define Directories

BASE_DIR=data_pipeline_linux
INPUT_DIR=$BASE_DIR/input
OUTPUT_DIR=$BASE_DIR/output
LOG_DIR=$BASE_DIR/logs
LOG_FILE=$LOG_DIR/preproces.log
INPUT_FILE="$INPUT_DIR/raw_sales_data.csv"
CLEANED_FILE="$OUTPUT_DIR/cleaned_sales_data.csv"
DATA_PATH="https://raw.githubusercontent.com/dataengineering-community/launchpad/refs/heads/main/Linux/sales_data.csv"

# Create directories if they do not exist.
mkdir -p $INPUT_DIR $OUTPUT_DIR $LOG_DIR

# Start logging

echo "==============================" >> $LOG_FILE
echo "Pipeline start running at: $(date)" >> $LOG_FILE

# Download the dataset from the source

if [ ! -f "$INPUT_FILE" ]; then
    echo "[$(date)] Downloading the raw sales data..." | tee -a "$LOG_FILE"
    if curl -s -o "$INPUT_FILE" "$DATA_PATH"; then
        echo "[$(date)] Dataset downloaded successfully to $INPUT_FILE" | tee -a "$LOG_FILE"
    else
        echo "[$(date)] Failed to download dataset from $DATA_PATH" | tee -a "$LOG_FILE"
        exit 1
    fi
else
    echo "[$(date)] Dataset already exists at $INPUT_FILE. Skipping download." | tee -a "$LOG_FILE"
fi

# Data cleaning and preprocessing
echo "[$(date)] Starting data cleaning..." | tee -a $LOG_FILE

# Remove row where status = Failed and remove the last column (extra_col)

awk 'BEGIN {FS=",";  OFS=","} $6 != "Failed" {print $1, $2, $3, $4, $5, $6}' "$INPUT_FILE" > "$CLEANED_FILE"

if [ $? -eq 0 ]; then
    echo "[$(date)] Data processing completed sucessfully. Cleaned file saved to $CLEANED_FILE" | tee -a $LOG_FILE
else
    echo "[$(date)] ERROR: Data cleaning failed." | tee -a $LOG_FILE
    exit 1
fi

# End of processing
echo "Pipeline  completed successfully at: [$(date)]" | tee -a $LOG_FILE
echo "=====================================" >> $LOG_FILE

