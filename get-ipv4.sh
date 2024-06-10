#!/usr/bin/env bash

docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' motionpro-jump
