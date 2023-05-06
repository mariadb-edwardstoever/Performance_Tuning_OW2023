/usr/bin/mariadb-slap \
  --delimiter=";" \
  --create_schema="pandrea" \
  --query="q_example_counts.sql" \
  --concurrency=3 \
  --iterations=10 --csv
