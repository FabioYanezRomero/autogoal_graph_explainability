#!/bin/bash
set -e

# Fix permissions for devuser and workspace
chown -R 1000:1000 /home/devuser || true
[ -d /workspace ] && chown -R 1000:1000 /workspace || true
chown -R 1000:1000 /tmp || true

# If running as root, drop privileges to devuser
if [ "$(id -u)" = "0" ]; then
  exec gosu devuser "$@"
else
  exec "$@"
fi
