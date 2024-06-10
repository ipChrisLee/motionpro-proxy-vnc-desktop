#!/usr/bin/env bash

mkdir -p res

if ! [ -f "res/MotionProInstaller.sh" ]; then
	wget https://support.arraynetworks.net/prx/001/http/supportportal.arraynetworks.net/downloads/pkg_9_4_0_505/MP_Linux_1.2.18/MotionPro_Linux_Ubuntu_x64_build-8383-34.sh -O res/MotionProInstaller.sh
fi

source env.sh

docker compose up motionpro-jump -d "$@"

docker exec -it motionpro-jump service ssh start

docker exec -it motionpro-jump vpnd

docker exec -it motionpro-jump MotionPro --host "${proxyHost}"
