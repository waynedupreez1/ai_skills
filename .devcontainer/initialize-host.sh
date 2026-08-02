#!/usr/bin/env bash
set -euo pipefail

root="${AGENT_DEVCONTAINER_HOME:-$HOME/.agent-devcontainer}"

mkdir -p \
  "$root/pi/agent" \
  "$root/claude" \
  "$root/codex" \
  "$root/opencode"
