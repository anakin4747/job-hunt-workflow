#!/bin/bash

# To move applications from working to applied
db="job-apps.db"

# Select the one to move to applied dir
applied=`ls working | fzf`


position=`echo $applied | cut -d '-' -f 1`
company=`echo $applied | cut -d '-' -f 3`

sql_cmd="SELECT id \
         FROM job_apps \
         WHERE company = '$company' \
         AND position = '$position';"
# Just dont have collisions and youll be fine

id=`echo $sql_cmd | sqlite3 $db`

number_of_ids=`echo $id | wc -l`

if [ $number_of_ids -gt 1 ]; then
    echo "Just dont have a collision"
    exit 1
fi

app_date=$(date "+%B %d, %Y")

sql_update_cmd="UPDATE job_apps \
                SET application_status = 'applied', \
                    date = '$app_date', \
                    resume_path = 'applied/$applied/$applied.tex' \
                WHERE id = $id;"

echo $sql_update_cmd | sqlite3 $db || exit 1

# Move it
mv working/$applied applied

