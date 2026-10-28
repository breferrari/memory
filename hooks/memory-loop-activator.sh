#!/bin/bash

r=$(git rev-parse --show-toplevel 2>/dev/null)
[ -n "$r" ] || r="${CLAUDE_PROJECT_DIR:-$PWD}"
[ -e "$r/.claude/.no-memory-loop" ] && exit 0

cat << 'EOF'
Memory: search the KB before a new phase, and on an unexpected error
before diagnosing it from scratch. Before your final reply, run
Skill(continuous-learning) once if this turn found a non-obvious cause,
settled a project decision the user made or agreed to, or showed a
memory is wrong or outdated. Never write .claude/memories/ directly.
EOF
