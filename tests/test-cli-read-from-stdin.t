#!/bin/sh
# vim: set ft=sh: ts=4:
set -eu

cd "$(dirname "$0")"

export TEST_NAME=$(basename "$0" '.t')

cat generic.in | ${ESH:-esh} - > "$TEST_NAME.err"
diff -uU 999 -L "$TEST_NAME.exp" -L "$TEST_NAME.err" \
	"$TEST_NAME.exp" "$TEST_NAME.err"
