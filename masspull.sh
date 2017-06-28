#!/bin/sh

for dir in ./*/
do 
	cd ${dir}
	git status >/dev/null 2>&1
	[ $(echo $?) -eq 0 ] && echo "Updating ${dir%*/}..." && git pull
	cd ..
done
