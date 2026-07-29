#!/bin/sh

#set -ex

#Use like ./pingtimestamp.sh $site

echo "$1"

ping -A "$1" | while IFS= read -r pong ; do echo "$(date): $pong"; done
