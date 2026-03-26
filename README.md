# Codewire Examples

Self-contained examples for the [Codewire](https://codewire.sh) platform.

## Examples

| Example | Description |
|---------|-------------|
| [openclaw](./openclaw/) | Spin up a remote OpenClaw agent sandbox and send it a task |

## Prerequisites

- [Codewire CLI](https://github.com/codewiresh/codewire) (`cw`) installed
- Authenticated: `cw login`

## MCP

All examples can also be driven from Claude Code via the Codewire MCP server:

```bash
claude mcp add codewire -- cw mcp-server
```

Then ask Claude Code to create environments, exec commands, upload files, etc.
