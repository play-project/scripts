#!/bin/bash
# Kill the Local PETALS DSB instance

echo "[DSB] Killing..."

petals_pid() {
	ps -eo "%p|%c|%a" \
		| sed -ne 's:^ *\([0-9]*\)|java *|.*server\.jar.*$:\1:p'
}

petals_kill() {
	sig="${1:-"TERM"}"
	petals_pid | xargs -r kill -$sig 2>&1 > /dev/null
	return 0
}

petals_kill

exit 0