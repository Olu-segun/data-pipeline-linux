#!/bin/bash

# Extracting csv file from github repository

curl -o raw_sales_data.csv "https://raw.githubusercontent.com/dataengineering-community/launchpad/refs/heads/main/Linux/sales_data.csv"

echo "[$(date)] Data extraction completed successfully." | tee -a ~/data_pipeline/logs/preprocess.log
