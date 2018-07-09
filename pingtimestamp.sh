#!/bin/sh



echo $1

ping -A $1 | while read pong ; do echo "$(date): $pong"; done