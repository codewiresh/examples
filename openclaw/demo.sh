#!/usr/bin/env bash
set -euo pipefail

# OpenClaw on Codewire -- create a remote agent sandbox and send it a task.
#
# Usage:
#   ./demo.sh
#   ./demo.sh "Write a REST API in Go"
#
# Prerequisites:
#   cw login
#   LLM API key in Codewire secrets (ANTHROPIC_API_KEY or similar)

NAME="openclaw-demo"
TTL="10m"
TASK="${1:-Write a Python function that checks if a string is a palindrome}"

cleanup() { cw env rm "$NAME" 2>/dev/null || true; }
trap cleanup EXIT

echo "==> Creating openclaw sandbox ($TTL TTL)..."
cw env create --image openclaw --name "$NAME" --ttl "$TTL" --yes

echo "==> Starting OpenClaw gateway..."
cw env exec "$NAME" -- bash -c \
  "openclaw gateway --bind=lan --port=18789 --allow-unconfigured &"
sleep 3

echo "==> Sending task: $TASK"
cw env exec "$NAME" --timeout 120 -- \
  curl -s -X POST http://localhost:18789/api/sessions/main/messages \
    -H "Content-Type: application/json" \
    -d "$(jq -n --arg msg "$TASK" '{message: $msg}')"

echo ""
echo "==> Done. Sandbox will be cleaned up on exit."
