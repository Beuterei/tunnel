#!/bin/sh

echo "Starting sshd and nginx ..."
exec /usr/sbin/sshd -D -e & exec nginx -g "daemon off;"
