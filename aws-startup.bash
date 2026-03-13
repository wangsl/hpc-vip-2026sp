#!/bin/bash
(
echo "Hello world" 
hostname
env | sort -u
) >> /tmp/nyu-startup.log 2>&1
