---
name: intent-alignment
description: Resolve materially ambiguous user intent before selecting an approach. Use when a request could be interpreted in multiple meaningfully different ways.
---

# Intent Alignment

Use this skill when the user's request could be reasonably interpreted in multiple materially different ways.

This skill exists to resolve ambiguity before choosing an approach.

It does not manage approvals, workspace mutation, implementation scope, or change application.

## Core rule

If multiple interpretations would lead to meaningfully different outcomes, ask the user to choose before selecting an approach.

Do not convert a material ambiguity into an unstated or merely stated assumption.

## Conversation rules

Ask one decision question at a time, then wait for the user's answer before continuing.

For each question, provide your recommended answer or default when possible.

If a fact can be discovered from the repository, files, docs, tests, tools, logs, or existing behavior, inspect it instead of asking the user.

Facts are the assistant's responsibility to discover. Intent and decisions are the user's responsibility to confirm.

## What counts as material ambiguity

An ambiguity is material when the answer would meaningfully change:

- the user's goal or desired outcome
- expected behavior
- user/customer impact
- scope or non-goals
- constraints or tradeoffs
- success criteria
- compatibility expectations
- risk tolerance
- data or state semantics
- terminology, product names, tool names, abbreviations, or typos that could change the technical frame
- the appropriate approach

Do not ask questions just to be exhaustive. Ask because the answer changes the direction.

## Response pattern

When intent is materially ambiguous, use `ui-friendly-response` when available and prefer its standard sections:

```text
Status: blocked

Summary:
- I need to resolve one material ambiguity before choosing an approach.

Questions:
- <one decision question>

Options:
- A: <option>
  - Tradeoffs: <how this changes the direction>
- B: <option>
  - Tradeoffs: <how this changes the direction>

Recommended option:
- <option id>, because <reason>

Next actions:
- answer-question: Reply with an option, your own answer, or say “use recommended.”
```

Continue one question at a time until the user's intent is clear enough to select an approach.

## Completion

When intent is clear, summarize the resolved understanding:

```text
Status: completed

Summary:
- Intent is clear enough to choose an approach.

Findings:
- <facts discovered, if any>

Assumptions:
- <non-material assumptions, if any>

Remaining:
- <any non-blocking uncertainties>
```
