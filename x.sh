#!/bin/bash
set -e

# When docker restarts, this file is still there,
# so we need to kill it just in case

_kill_procs() {
  kill -TERM $node
}

# Relay quit commands to processes
trap _kill_procs SIGTERM SIGINT

dumb-init -- node ./build/index.js $@
node=$!

wait $node
