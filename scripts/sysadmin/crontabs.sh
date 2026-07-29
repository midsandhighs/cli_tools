#!/bin/sh

# Dump every local user's crontab. Needs sudo/root to read other users' tables.

cut -f1 -d: /etc/passwd | while IFS= read -r user; do
	crontab -u "$user" -l
done
