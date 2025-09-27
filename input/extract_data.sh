#!/bin/bash

# Extracting csv file from github repository
curl -o raw_sales_data.csv "https://raw.githubusercontent.com/dataengineering-community/launchpad/refs/heads/main/Linux/sales_data.csv"

# Removing unwanted column (keeping first 6 columns)
awk -F,  '{print $1, $2, $3, $4, $5, $6}' raw_sales_data.csv > ~/data_pipeline/output/cleaned_sales_data.csv


echo "Data ingestion and transformation completed." 
