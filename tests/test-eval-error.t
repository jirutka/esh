#!/bin/sh
# vim: set ts=4:
set -u

export TEST_NAME='test-eval-error'

cd "$(dirname "$0")"

# Generate expectation file based on the used shell.
cmd() {
	${ESH_SHELL:-sh} -c 'set -eu; echo $undefined_var'
}
msg=$(cmd 2>&1 | rev | cut -d: -f1-2 | rev)
cmd >/dev/null 2>&1 || status=$?

cat > $TEST_NAME.exp2 <<EOF
$TEST_NAME.in:4: ${msg# *}
%exit-status: $status
EOF
trap "rm '$TEST_NAME.exp2'" EXIT HUP INT TERM

./diff-test
