#!/usr/bin/env bash
#!/usr/bin/env bash
set -euo pipefail

# Setup the host agent devcontainer directory, defaulting to ~/.agent-devcontainer if AGENT_DEVCONTAINER_HOME is not set
host_agent_devcontainer="${AGENT_DEVCONTAINER_HOME:-$HOME/.agent-devcontainer}"

mkdir -p \
  "$host_agent_devcontainer/pi/agent" \
  "$host_agent_devcontainer/agents" \
  "$host_agent_devcontainer/claude" \
  "$host_agent_devcontainer/codex" \
  "$host_agent_devcontainer/opencode"

# Setup the host agent devcontainer directory, defaulting to ~/.agent-devcontainer if AGENT_DEVCONTAINER_HOME is not set
host_agent="${AGENT_HOME:-$HOME/.agents}"

mkdir -p "$host_agent"

mkdir -p "$HOME/.ssh"

if [ -n "${SSH_AUTH_SOCK:-}" ] && [ -S "$SSH_AUTH_SOCK" ]; then
  rm -f "$HOME/.ssh/ssh-auth-sock"
  ln -s "$SSH_AUTH_SOCK" "$HOME/.ssh/ssh-auth-sock"
  echo "SSH agent socket linked: $HOME/.ssh/ssh-auth-sock -> $SSH_AUTH_SOCK"
else
  echo "Warning: SSH_AUTH_SOCK is not set or not a socket: ${SSH_AUTH_SOCK:-unset}"
  rm -f "$HOME/.ssh/ssh-auth-sock"
  touch "$HOME/.ssh/ssh-auth-sock"
fi
