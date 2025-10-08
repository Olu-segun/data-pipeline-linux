#!/bin/bash

# Filtering out the row where Status column = "Failed" and selecting the needed columns.

output=~/data_pipeline/output/cleaned_sales_data.csv 
logs=~/data_pipeline/logs/preprocess.log

awk 'BEGIN {FS=",";  OFS=","} $6 != "Failed" {print $1, $2, $3, $4, $5, $6}' /home/olukayodeoluseguno-1/data_pipeline/input/raw_sales_data.csv > $output

echo "[$(date)] Data processing completed sucessfully." | tee -a $logs
