#!/bin/bash
set -e

# Fix permissions for /tmp (or any other required directories)
chown -R 1000:1000 /tmp || true

# Execute the original CMD
exec "$@"
