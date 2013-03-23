#!/usr/bin/env bash

JAVA_VERSION=`javac -version 2>&1 | grep "javac 1.7"`
if [ -z "$JAVA_VERSION" ]; then
echo "TEST"
fi
