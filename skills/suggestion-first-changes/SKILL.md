---
name: suggestion-first-changes
description: Enforce a suggestion-first workflow for coding agents. Use when the user wants the AI to avoid changing files unless explicitly asked, prefers recommendations before edits, or says not to make changes automatically. Default to inspect and suggest; only modify files after clear approval.
---

# Suggestion-First Changes

Use this skill when the user wants the AI agent to stop making project changes by default. The default behavior is **inspect, explain, and suggest**. Do not edit files, install dependencies, run mutating commands, or reorganize the project unless the user explicitly asks for changes.

## Goal

Protect the user's project from unwanted AI edits. The agent should be helpful by analyzing, reviewing, planning, and recommending, but should not alter the workspace unless the user clearly authorizes implementation.

## When to Use

Use this skill when the user says or implies:

- do not make changes unless I ask
- stop changing my project automatically
- suggest changes first
- review only
- audit this repo
- tell me what you would change
- make a plan before editing
- I hate when AI just changes files
- no destructive changes
- ask before modifying files

## Core Rule

Unless the user explicitly asks the agent to make changes, the agent must default to:

```text
inspect -> analyze -> recommend -> ask
```

Not:

```text
inspect -> edit
```

## What Counts as Explicit Permission

The user has given permission to edit when they use clear implementation language such as:

- make the changes
- apply that
- update the file
- edit this
- create the file
- implement it
- fix it
- refactor it
- add this to the repo
- generate this skill
- write the config

Ambiguous language is not permission. If unsure, ask.

## Safe Without Approval

These actions are normally allowed when relevant to the request:

- read files
- inspect repository structure
- run non-mutating commands, such as `ls`, `find`, `rg`, `git status`, and version checks
- explain what exists
- identify issues, risks, and opportunities
- propose changes
- provide patches or snippets in the chat without applying them
- make a checklist or implementation plan

## Requires Explicit Approval

Ask before doing any of these:

- editing existing files
- creating new files, unless the user clearly asked to generate/create something
- deleting files or directories
- moving or renaming files/folders
- installing dependencies
- changing package manifests or lockfiles
- changing config files
- changing CI, hooks, Dev Containers, VS Code settings, or licensing
- running formatters or auto-fixers
- running commands that modify the working tree
- making broad refactors

## Never Do Without Specific Approval

Never do these unless the user explicitly approves the specific action:

- delete code/files
- rewrite architecture
- replace tooling
- change public APIs
- change licenses
- run destructive shell commands
- apply formatters across the whole repo
- commit, push, or alter Git history

## Response Pattern

When the user asks for advice, review, setup guidance, or standards, respond with a suggestion-first structure:

```text
I inspected/found: ...

Recommendations:
1. ...
2. ...
3. ...

If you want me to apply this, I would change:
- file/path: ...
- file/path: ...

Commands I would run:
- ...

Should I make these changes?
```

## Approval Pattern

Before editing, clearly separate low-risk and higher-risk changes:

```text
Proposed changes:
- Low risk: ...
- Needs approval because it changes project behavior: ...

I will not modify files until you confirm.
```

## If the User Approves

After approval:

1. Apply only the approved changes.
2. Keep edits small and focused.
3. Do not expand the scope without asking again.
4. Summarize changed files.
5. Mention validation commands run or recommend commands to run.

## If the User Asks for a Plan

Do not implement the plan. Provide:

- current state summary
- proposed target state
- ordered steps
- risks/tradeoffs
- files likely affected
- commands likely needed
- approval question

## If Another Skill Suggests Edits

This skill overrides implementation eagerness. Other skills may recommend changes, but this skill requires approval before applying them unless the user explicitly asked for implementation.

Example:

- `project-standards-setup` may identify formatter/linter/dev-container changes.
- This skill requires the agent to present the plan first and ask before editing files.

## Completion Criteria

The interaction is successful when:

- the user understands what the agent recommends
- the agent has not changed files without clear permission
- any applied changes match the approved scope
- the agent explains what was changed and what remains optional
