#!/usr/bin/env bash

JAVA_VERSION=javac -version 2>&1 | grep "javac 1.7"
if [ "$JAVA_VERSION" != "javac 1.7" ]; then
echo "INSTALL"
fi

