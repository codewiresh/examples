# OpenClaw

Spin up a remote [OpenClaw](https://github.com/openclaw/openclaw) agent in a Codewire sandbox and send it a coding task.

## Prerequisites

- `cw login`
- LLM API key in Codewire secrets (e.g. `ANTHROPIC_API_KEY`)
- `jq` installed locally

## Run

```bash
./demo.sh
./demo.sh "Write a REST API in Go"
```

What happens:
1. Creates a sandbox running the `openclaw` image
2. Starts the OpenClaw gateway inside it
3. Sends your task to the agent via the gateway API
4. Prints the response
5. Cleans up the sandbox on exit

## Via MCP (Claude Code)

Instead of the shell script, you can use Claude Code with the Codewire MCP server. This registers `cw` as an MCP tool provider so Claude Code can create environments, exec commands, and upload files directly.

```bash
# Register the MCP server (one-time setup)
claude mcp add --scope user codewire -- cw mcp-server

# Then in Claude Code, just ask:
# "Create an openclaw environment and ask it to write a fibonacci function"
```

Claude Code will use `codewire_create_environment`, `codewire_exec_in_environment`, etc. to drive the sandbox.
