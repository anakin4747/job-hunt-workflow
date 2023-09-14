#!/bin/bash

# To move applications from applied to rejected
db="job-apps.db"

# Select the one to move to rejected dir
rejected=`ls applied | grep -v rejected | fzf`


position=`echo $rejected | cut -d '-' -f 1`
company=`echo $rejected | cut -d '-' -f 3`

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

sql_update_cmd="UPDATE job_apps \
                SET application_status = 'rejected', \
                    resume_path = 'applied/rejected/$rejected/$rejected.tex' \
                WHERE id = $id;"

echo $sql_update_cmd | sqlite3 $db || exit 1

# Move it
mv applied/$rejected applied/rejected

