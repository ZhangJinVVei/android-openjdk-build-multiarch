#!/bin/bash
set -e
if [[ "$TARGET_JDK" == "arm" ]]; then
  git clone --depth 1 https://github.com/openjdk/aarch32-port-jdk8u openjdk
elif [[ "$BUILD_IOS" == "1" ]]; then
  git clone --depth 1 https://github.com/corretto/corretto-8 openjdk
else
  # Newer jdk8u tags changed flags.m4 enough to break our Android patch set.
  OPENJDK_ANDROID_REF="${OPENJDK_ANDROID_REF:-jdk8u432-b01}"
  git clone --depth 1 --branch "$OPENJDK_ANDROID_REF" https://github.com/openjdk/jdk8u openjdk
fi
