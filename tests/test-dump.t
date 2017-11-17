#!/bin/sh

cd "$(dirname "$0")"

export TEST_NAME='test-dump'

# XXX: This is very hack-ish.
if [ "$ESH_SHELL" ]; then
	sed -i.orig "s|^#!/bin/sh|#!$ESH_SHELL|" $TEST_NAME.exp
fi

ESH="${ESH:-esh} -d" ./diff-test generic; res=$?

if [ "$ESH_SHELL" ]; then
	mv $TEST_NAME.exp.orig $TEST_NAME.exp
fi

exit $res
