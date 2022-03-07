#!/bin/bash

data_dir="/home/mark/projects/tennis-prediction/data/"

# remove excessive files (output from previous runs)
rm $(ls | grep -P "^matches_\d{4}")

# for each year, copy the merged file
for year in {2000..2020}; do
    cat atp_matches_$year.csv > matches_$year.csv

    # delete the first line of 2 csv files (to avoid duplicate csv headers)
    sed '1d' atp_matches_qual_chall_$year.csv >> matches_$year.csv
    sed '1d' atp_matches_futures_$year.csv >> matches_$year.csv

    mv "matches_$year.csv" $data_dir
    echo "matches_$year"
done

cp atp_players.csv $data_dir

echo "done"

