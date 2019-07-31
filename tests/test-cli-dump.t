#!/bin/sh
# vim: set ft=sh: ts=4:
cd "$(dirname "$0")"

export TEST_NAME=$(basename "$0" '.t')

# XXX: This is very hack-ish.
if [ "$ESH_SHELL" ]; then
	sed -i.orig "s|^#!/bin/sh|#!$ESH_SHELL|" $TEST_NAME.exp
fi

TEST_COMMAND="${ESH:-esh} -d $TEST_NAME.in" ./diff-test; res=$?

if [ "$ESH_SHELL" ]; then
	mv $TEST_NAME.exp.orig $TEST_NAME.exp
fi

exit $res
