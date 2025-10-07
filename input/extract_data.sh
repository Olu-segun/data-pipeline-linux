#!/bin/bash

# Extracting csv file from github repository

curl -o /home/olukayodeoluseguno-1/data_pipeline/input/raw_sales_data.csv "https://raw.githubusercontent.com/dataengineering-community/launchpad/refs/heads/main/Linux/sales_data.csv"

#Success Message
echo "[$(date)] Data extraction completed successfully." | tee -a ~/data_pipeline/logs/preprocess.log
