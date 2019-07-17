#!/bin/sh
set -o errexit
set -o nounset
exec docker-entrypoint.sh rabbitmq-server
