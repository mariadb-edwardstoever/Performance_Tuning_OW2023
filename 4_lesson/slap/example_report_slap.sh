#!/bin/bash
# Script By Edward Stoever for Mariadb OpenWorks 2023

OUTPUT_FILE='/root/openworks/4_lesson/slap/report.out'
FULL_REPORT_FILENAME='/root/openworks/4_lesson/slap/q_example_report.sql'
REPORT_BASENAME=$(basename $FULL_REPORT_FILENAME)

CSV=$(/usr/bin/mariadb-slap \
  --delimiter=";" \
  --create_schema="pandrea" \
  --query="$FULL_REPORT_FILENAME" \
  --concurrency=4 \
  --iterations=2 \
  --csv)

printf "$REPORT_BASENAME$CSV\n" > $OUTPUT_FILE

# q_example_report.sql,mixed,0.300,0.300,0.300,4,2

SQL="LOAD DATA LOCAL INFILE 
    '$OUTPUT_FILE' 
    INTO TABLE slap.slap_results 
    FIELDS TERMINATED BY ','
    LINES TERMINATED by '\n' 
( script,
  load_type,
  average_seconds,
  minimum_seconds,
  maximum_seconds,
  client_count,
  queries_per_session
);"
mariadb -ABNe "$SQL"
 
