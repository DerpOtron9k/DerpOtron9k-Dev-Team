# MCP Stack

## Default MCP Staples

This workflow treats these as the default MCP foundation:

1. **Serena**
   - semantic code retrieval and editing
   - official source: [oraios/serena](https://github.com/oraios/serena)
2. **Context7**
   - current library and framework documentation
   - official source: [upstash/context7](https://github.com/upstash/context7)
3. **Task Master**
   - delivery-layer PRD and backlog management

## Kickoff Rule

At kickoff, confirm whether Serena and Context7 are available.

If either one is missing, treat that as early setup work rather than an optional later optimization.

## Config Template

Use:

- [`.codex/config.toml.example`](/__PROJECT_PATH__/.codex/config.toml.example)
