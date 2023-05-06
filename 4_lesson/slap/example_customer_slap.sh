/usr/bin/mariadb-slap \
  --delimiter=";" \
  --create_schema="pandrea" \
  --query="q_example_customer_activity.sql" \
  --concurrency=10 \
  --iterations=5
