#!/bin/bash

# Filtering out the row where Status column = "Failed" and selecting the needed columns.
awk -F, 'BEGIN{OFS=","} $6 != "Failed" {print $1, $2, $3, $4, $5, $6}' raw_sales_data.csv > ~/data_pipeline/output/cleaned_sales_data.csv


#echo "Data ingestion and transformation completed." > ~/data_pipeline/logs/preprocess.log
