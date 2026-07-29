#!/bin/sh

for dir in ./*/
do
	# Subshell per repo: a failed cd is contained and cwd never drifts.
	(
		cd "${dir}" || exit 0
		git status >/dev/null 2>&1 && echo "Updating ${dir%*/}..." && git pull
	)
done
