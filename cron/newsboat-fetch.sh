#!/bin/sh

newsboat -x reload
echo "`date +'%Y-%m-%d %H:%M:%S'` newsboat fetch feeds"
