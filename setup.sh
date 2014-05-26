#!/bin/sh
#
# initial dev setup script
#
CWD=`pwd`
NAME=${NAME:=appcelerator}
PREFIX="git clone git@github.com:$NAME/hyperloop"
ESC_SEQ="\x1b["
RESET=$ESC_SEQ"39;49;00m"
RED=$ESC_SEQ"31;01m"
GREEN=$ESC_SEQ"32;01m"
YELLOW=$ESC_SEQ"33;01m"
BLUE=$ESC_SEQ"34;01m"
MAGENTA=$ESC_SEQ"35;01m"
CYAN=$ESC_SEQ"36;01m"
GRAY=$ESC_SEQ"90;01m"

function colorize()
{
	echo "$1$2"
}

function project()
{
	if [ -d "hyperloop-$1" ]; then
		colorize $YELLOW "Updating ${MAGENTA}hyperloop-$1$GRAY"
		cd hyperloop-$1
		git pull
	else
		colorize $YELLOW "Fetching ${MAGENTA}hyperloop-$1$GRAY"
		${PREFIX}-$1.git
		colorize $RESET ""
		cd hyperloop-$1
	fi
	colorize $YELLOW "updating NPM libraries for ${MAGENTA}hyperloop-$1$GRAY"
	result=`npm install 2>&1`
	cd $CWD
	colorize $RESET ""
}

project "common"

if [ ! -d "node_modules/hyperloop-common" ]; then
	mkdir node_modules 2>/dev/null
	cd node_modules
	ln -s ../hyperloop-common
	cd $CWD
fi

project "cli"

project "java"

if [ ! -d "node_modules/hyperloop-java" ]; then
	mkdir node_modules 2>/dev/null
	cd node_modules
	ln -s ../hyperloop-java
	cd $CWD
fi

project "android"

project "ios"
#project "windows"
