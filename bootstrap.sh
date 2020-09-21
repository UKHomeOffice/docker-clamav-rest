#!/bin/bash
set -m

host=${CLAMD_HOST:-127.0.0.1}
port=${CLAMD_PORT:-3310}

echo "Using clamd server: $host:$port"

# start in background
java -jar /app/clamav-rest.jar --clamd.host=$host --clamd.port=$port
