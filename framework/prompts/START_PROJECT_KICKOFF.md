# Start Dev Team Kickoff

Use this as the standard kickoff trigger for a newly bootstrapped or newly adopted project.

## Trigger Phrase

```text
Start Dev Team Kickoff
```

Acceptable alias:

```text
Run project kickoff
```

## Expected LLM Behavior

When the user uses the kickoff trigger, the LLM should:

1. inspect the repository state
2. identify whether the project is:
   - new
   - inherited
   - already mid-development
3. identify or confirm the Product Owner
4. inspect installed seats in `.codex/agents/`
5. inspect whether Serena and Context7 are configured or missing
6. recommend any missing council or delivery seats needed for this project
7. read:
   - `AGENTS.md`
   - `docs/COUNCIL.md`
   - `docs/DELIVERY_MODEL.md`
   - `docs/CEREMONIES.md`
   - `docs/MCP_STACK.md` if present
   - `.taskmaster/docs/prd.txt` if present
8. produce a kickoff output that covers:
   - product framing
   - primary user and job to be done
   - non-goals
   - technical boundary assumptions
   - MCP/tooling readiness
   - initial epic map
   - current sprint recommendation or backlog-refinement recommendation
   - top Product Owner confirmations needed
9. update repo artifacts if the user wants the kickoff formalized

## Kickoff Output Shape

The kickoff should answer:

- What is this product trying to be?
- Who is it for?
- What is intentionally out of scope?
- What should the first 1 to 2 delivery bets be?
- Which seats should be active in the council and delivery ring?
- Should the team hold sprint planning now, or backlog refinement first?

## Guardrails

- Do not create a separate planning bureaucracy unless the project needs it.
- Prefer updating existing PRD, epic, sprint, and continuity artifacts over creating duplicate docs.
- Treat Task Master as the delivery-layer system, not the architecture source of truth.
- Keep the user in the Product Owner role unless they explicitly choose otherwise.
