#!/bin/sh

#set -ex

#Use like ./pingstimestamp.sh $site

echo $1

ping -A $1 | while read pong ; do echo "$(date): $pong"; done