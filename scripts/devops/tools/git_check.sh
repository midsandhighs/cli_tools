#!/bin/sh
# set -v
# # #
# quick git check and update script
#
# Run from a parent directory that holds git checkouts as immediate
# subdirectories; each one is fetched, described, and pulled.
# # #
# OS agnostic paths
PATH=/bin:/usr/bin:/usr/local/bin:/sbin:/opt/homebrew/bin

#
parse_git_branch () {
	BRANCH=$(git branch 2>&1 | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
	# Always recompute status; the old code reused a stale STAT from the
	# previous repo when BRANCH was empty (e.g. a repo with no commits).
	STAT=$(parse_git_dirty)
	echo "[${BRANCH}${STAT}]"
}
#
parse_git_dirty () {
	status=$(git status 2>&1)
	bits=''
	printf '%s' "${status}" | grep -q "renamed:"               && bits=">${bits}"
	printf '%s' "${status}" | grep -q "Your branch is ahead of" && bits="*${bits}"
	printf '%s' "${status}" | grep -q "new file:"              && bits="+${bits}"
	printf '%s' "${status}" | grep -q "Untracked files"        && bits="?${bits}"
	printf '%s' "${status}" | grep -q "deleted:"               && bits="x${bits}"
	printf '%s' "${status}" | grep -q "modified:"              && bits="!${bits}"
	if [ -n "${bits}" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}
#
git_check () {
for dir in ./*/
do
	echo "git status of ${dir}"
	# Run each repo in a subshell so a failed cd can't leak into the next
	# iteration and we never have to cd back out.
	(
		cd "${dir}" || exit 0
		echo "git fetching ${dir%*/}..." && git fetch
		parse_git_branch
		parse_git_dirty
		git pull
	)
done
}
git_check
