#!/bin/bash

dec_suffix=".dec"

if [ "$1" != "dec" ]; then
    echo ">>>>>> Error: Unsupported command"
    exit 1
fi

command="$1"; shift

if [ -z "$1" ]; then
    echo ">>>>>> Error: No path provided"
    exit 1
fi

path="$1"; shift

if [ ! -f "$path" ]; then
    echo ">>>>>> Error: File does not exist: $path"
    exit 1
fi

set -x
sops -d $path > $path${dec_suffix}