#!/bin/sh
# set -v
# # #
# quick git check and update script
# # #
# OS agnostic paths
PATH=/bin:/usr/bin:/usr/local/bin/:/sbin:/opt/homebrew/bin

# 
function parse_git_branch () {
	BRANCH=`git branch 2>&1 | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo "[${BRANCH}${STAT}]"
	fi
}
#
function parse_git_dirty () {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2>&1  | grep "modified:" 2>&1 ; echo "$?"`
	untracked=`echo -n "${status}" 2>&1  | grep "Untracked files" 2>&1 ; echo "$?"`
	ahead=`echo -n "${status}" 2>&1  | grep "Your branch is ahead of" 2>&1 ; echo "$?"`
	newfile=`echo -n "${status}" 2>&1  | grep "new file:" 2>&1 ; echo "$?"`
	renamed=`echo -n "${status}" 2>&1  | grep "renamed:" 2>&1 ; echo "$?"`
	deleted=`echo -n "${status}" 2>&1  | grep "deleted:" 2>&1 ; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}
#
function git_check () {
for dir in ./*/
do 
	echo "git status of ${dir}"
    cd ${dir}
    [ $(echo $?) -eq 0 ] && echo "git fetching ${dir%*/}..." && git fetch
    parse_git_branch
    parse_git_dirty
    git pull
	cd ..
done
}
git_check
