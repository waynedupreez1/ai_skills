---
name: approval-first-workflow
description: Require inspect-plan-approve before workspace changes. Use for requests that may edit files, run mutating commands, change dependencies, config, Git state, or workflow behavior.
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

Use `ui-friendly-response` when available for response formatting. This skill only defines the approval semantics that the response must communicate.

Approval proposals must clearly communicate:

- what was inspected
- assumptions and blocking questions, if any
- the exact proposed scope
- whether approval is required
- what approval would authorize

When using `ui-friendly-response`, approval proposals usually use `Status: waiting_for_approval`.

Completion summaries must clearly communicate:

- what approved scope was applied
- what validation was run and what happened
- what was skipped and why
- what remains unresolved or optional

When using `ui-friendly-response`, completion summaries usually use `Status: completed`.

Blocked workflows must clearly communicate:

- why the workflow is blocked
- what input, access, dependency, or approval is needed to proceed

When using `ui-friendly-response`, blocked workflows usually use `Status: blocked`.
