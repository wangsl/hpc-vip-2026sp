#!/bin/bash
(
echo "Hello world" 
hostname
env | sort -u
yum install emacs -y
) >> /tmp/nyu-startup.log 2>&1
