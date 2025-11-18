# Data Pipeline: Automated Sales Data Preprocessing (Linux Bash Script)

This project contains a lightweight, automated **ETL-style data
pipeline** built using **Bash**.\
It downloads raw sales data from a remote source, performs data cleaning
using `awk`, organizes files into structured directories, and logs all
pipeline activities.

The pipeline is designed to run on **Linux** and demonstrates
foundational data engineering principles such as ingestion,
preprocessing, and logging.

------------------------------------------------------------------------

## 🚀 Features

-   Automatically creates a structured pipeline directory:
    -   `/input` for raw data
    -   `/output` for cleaned data
    -   `/logs` for pipeline logs
-   Downloads raw sales dataset from a public GitHub URL
-   Cleans the dataset by:
    -   Removing rows where `status = Failed`
    -   Dropping the last column
-   Saves cleaned output into a separate folder
-   Maintains detailed logs of each pipeline run
-   Fully automated and reproducible

------------------------------------------------------------------------

## 📁 Project Structure

    data_pipeline/
    │── input/
    │   └── raw_sales_data.csv
    │── output/
    │   └── cleaned_sales_data.csv
    │── logs/
    │   └── preprocess.log
    │── preprocess.sh

------------------------------------------------------------------------

## 📥 How It Works

### 1. Download Raw Data

The script checks if the file exists in `input/`.\
If not, it downloads it from:

    https://raw.githubusercontent.com/dataengineering-community/launchpad/refs/heads/main/Linux/sales_data.csv

### 2. Clean & Preprocess Data

Using `awk`, it: - Removes rows where the 6th column (`status`) equals
`"Failed"` - Drops the last column (`extra_col`) - Writes the cleaned
file into `output/`

### 3. Logging

All activities are logged into:

    data_pipeline/logs/preprocess.log

Logs include timestamps for: - Script start - File download status -
Cleaning progress - Pipeline completion

------------------------------------------------------------------------

## 🛠️ Setup & Usage

### 1. Make the script executable

``` bash
chmod +x preprocess.sh
```

### 2. Run the pipeline

``` bash
./preprocess.sh
```

### 3. Check logs

``` bash
cat data_pipeline/logs/preprocess.log
```

------------------------------------------------------------------------

## 📊 Data Cleaning Logic

This `awk` command performs the transformation:

``` bash
awk 'BEGIN {FS=",", OFS=","} $6 != "Failed" {print $1, $2, $3, $4, $5, $6}'
```

Meaning: - Only print rows where column 6 is **not** `"Failed"` - Only
output the first 6 columns (removing extra column)

------------------------------------------------------------------------

## ✅ Requirements

-   Linux environment (WSL, Ubuntu, or any distro)
-   `curl`
-   `awk`
-   Bash shell

------------------------------------------------------------------------

## 🧩 Script File: preprocess.sh

> The script that powers the entire pipeline is located in the root
> folder and handles directory creation, ingestion, cleaning, and
> logging.

------------------------------------------------------------------------

## 🧑‍💻 Author

Olusegun Olukayode\
Data and Analytics Engineer | Business Intelligence Analyst | Automation Enthusiast



