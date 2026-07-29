#!/bin/sh

# Create a macOS standard (service) user account.
# Tested on 10.15. Must be run as root (dscl writes to the local directory node).
#
# Usage: sudo ./mac_user_create.sh <shortname> [real name]

set -eu

if [ "$(id -u)" -ne 0 ]; then
	echo "This script must be run as root (use sudo)." >&2
	exit 1
fi

if [ $# -lt 1 ]; then
	echo "Usage: $0 <shortname> [real name]" >&2
	exit 1
fi

username=$1
realname=${2:-$username}

# Refuse to clobber an existing account.
if dscl . -read "/Users/$username" >/dev/null 2>&1; then
	echo "User '$username' already exists; aborting." >&2
	exit 1
fi

# Pick the next free UID at or above 501 (the macOS standard-user range) so we
# never collide with an existing account.
lastid=$(dscl . -list /Users UniqueID | awk '{print $2}' | sort -n | tail -1)
if [ -z "$lastid" ] || [ "$lastid" -lt 500 ]; then
	newid=501
else
	newid=$((lastid + 1))
fi

echo "Creating user '$username' (uid $newid)"
dscl . -create "/Users/$username"
dscl . -create "/Users/$username" UserShell /bin/zsh
dscl . -create "/Users/$username" RealName "$realname"
dscl . -create "/Users/$username" UniqueID "$newid"
dscl . -create "/Users/$username" PrimaryGroupID 20
dscl . -create "/Users/$username" NFSHomeDirectory "/Users/$username"

echo "Set a password for '$username':"
passwd "$username"

# Create the home directory from the system template.
createhomedir -c -u "$username" >/dev/null

# Grant Apple Remote Desktop / screen-sharing access on this device.
dseditgroup -o edit -a "$username" -t user com.apple.access_screensharing

echo "Done. User '$username' created."
