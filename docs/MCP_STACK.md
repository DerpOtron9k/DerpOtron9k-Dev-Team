# MCP Stack

## Default MCP Staples

These MCPs are treated as the default foundation for this AI development model:

1. **Serena**
   - semantic code retrieval and editing
   - best for symbol-aware code navigation, references, targeted edits, and project memory
   - official source: [oraios/serena](https://github.com/oraios/serena)

2. **Context7**
   - current library and framework documentation
   - best for up-to-date API usage, setup guidance, and version-aware coding help
   - official source: [upstash/context7](https://github.com/upstash/context7)

3. **Task Master**
   - delivery-layer backlog and PRD system
   - best for PRD, PBIs, subtasks, status, and next-task flow

## Why These Are Default

- **Serena** improves codebase precision and reduces token waste.
- **Context7** reduces stale library guidance and hallucinated APIs.
- **Task Master** keeps delivery state and backlog structure explicit.

## Kickoff Rule

At project kickoff, confirm whether these are available:

- Serena configured and reachable
- Context7 configured and reachable
- Task Master available or intentionally deferred

If Serena or Context7 is missing, treat that as setup work early in kickoff rather than a later optimization.

## Config Template

Use:

- [.codex/config.toml.example](/R:/GitRepo/DerpOtron9k-Dev-Team/.codex/config.toml.example)

## Official Configuration Notes

### Serena

Recommended MCP server pattern:

```toml
[mcp_servers.serena]
command = "uvx"
args = ["--from", "git+https://github.com/oraios/serena", "serena", "start-mcp-server", "--transport", "stdio"]
startup_timeout_sec = 60.0
```

### Context7

Recommended MCP server pattern:

```toml
[mcp_servers.context7]
command = "npx.cmd"
args = ["-y", "@upstash/context7-mcp"]
startup_timeout_sec = 60.0

[mcp_servers.context7.env]
CONTEXT7_API_KEY = "set-me"
```

Context7's official repo documents both CLI + Skills and MCP modes. For this workflow, MCP mode is the intended default. Source: [upstash/context7](https://github.com/upstash/context7)
