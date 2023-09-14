#!/bin/bash

# To create new applications and edit resumes
# So this script will make a working resume folder for an application

db="job-apps.db"

# Get info
read -p "Company: " company
read -p "Position: " position
read -p "Location: " location
read -p "URL: " url

title="$position-at-$company"

# Copy template
cp -r template "working/$title"

# Create latex doc name
resume_tex="working/$title/$title.tex"

# Name the resume file appropriately
mv "working/$title/resume.tex" "$resume_tex"

app_status="working"

sql_cmd="INSERT INTO job_apps \
        (company, position, application_status, location, url) \
        VALUES \
        ('$company', '$position', '$app_status', '$location', '$url');"

echo $sql_cmd | sqlite3 $db
