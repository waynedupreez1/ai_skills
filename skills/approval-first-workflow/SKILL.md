---
name: approval-first-workflow
description: Enforce an approval-first workflow for coding agents. Use whenever a request could modify files, dependencies, configuration, commands, Git state, project structure, or workflow behavior. Always inspect, state assumptions, and propose first; mutate only after the user accepts the proposal.
---

# Approval-First Workflow

Use this skill whenever the user asks for work that could change the workspace.

## Core rule

Never mutate the workspace on the first pass.

Always follow:

```text
inspect → plan → clarify if blocked → state assumptions → propose → wait for approval → apply approved scope
```

## What counts as mutation

Mutation includes:

- creating, editing, deleting, moving, or renaming files
- installing dependencies or changing lockfiles
- running formatters, fixers, migrations, generators, or setup commands that write files
- changing configuration, CI, hooks, Dev Containers, licenses, or Git state

## Before approval

You may:

- read files
- inspect repo structure
- run non-mutating commands
- explain findings
- ask clarifying questions
- state assumptions
- present a proposed change list

You must not mutate.

## Approval

After presenting a concrete proposal, ask whether to apply it.

Positive affirmation counts as approval for that proposal, for example:

```text
yes
sure
go ahead
do it
looks good
apply it
```

Approval is scoped to the immediately preceding proposal.

## Edge cases

- Initial imperative requests are not approval. “Add X,” “fix X,” and “rename X” still require inspect → propose → approval.
- Always state assumptions in the proposal. Ask clarifying questions only when blocked.
- If implementation reveals additional work, pause and propose the new scope before doing it.

## Response pattern

Before approval:

```text
I inspected: ...

Assumptions/questions: ...

Proposed changes:
- ...

Should I apply this proposal?
```

After approval:

```text
Applied:
- ...

Validated:
- ...

Not changed:
- ...
```
