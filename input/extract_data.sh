#!/bin/bash

# Extracting csv file from github repository

data_path="https://raw.githubusercontent.com/dataengineering-community/launchpad/refs/heads/main/Linux/sales_data.csv"
logs=~/data_pipeline/logs/preprocess.log

curl -o /home/olukayodeoluseguno-1/data_pipeline/input/raw_sales_data.csv $data_path

#Success Message
echo "[$(date)] Data extraction completed successfully." | tee -a $logs
