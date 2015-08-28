#!/usr/bin/env bash

download () {
	local dirname="../$1"
	local reponame=$2
	if [ ! -d "$dirname" ]; then
		echo Cloning $dirname
		git clone $reponame "$dirname"
	fi
}
download deployr-docker https://github.com/warmdev/deployr-docker.git
download radiant-docker https://github.com/warmdev/radiant-docker.git
download miracle https://github.com/comses/miracle.git
