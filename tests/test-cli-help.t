#!/bin/sh
# vim: set ft=sh: ts=4:
cd "$(dirname "$0")"

export TEST_NAME=$(basename "$0" '.t')

TEST_COMMAND="${ESH:-esh} -h" ./diff-test
