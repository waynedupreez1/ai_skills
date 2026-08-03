---
name: ui-friendly-response
description: Always use for all user interactions. Format responses with stable statuses and sections for clear human/UI-readable communication.
---

# UI-Friendly Response

Use this skill when responses should be predictable, human-readable, complete, and easy for a UI to render.

This skill defines the human/UI response contract. A future companion skill, `api-friendly-response`, can define strict JSON or schema-first output for programmatic consumers.

## Goals

- Keep responses easy for humans to scan without omitting important details.
- Use stable status values and section names that a UI can render consistently.
- Support proposals, approvals, options, branching, completion summaries, validation results, and blocked states.
- Keep formatting guidance here so other skills can reference it instead of copying response templates.

## Status values

Use one primary status as the first line of the response:

- `inspecting` — gathering information; no proposal or action yet.
- `proposing` — presenting recommendations, options, or a non-mutating plan.
- `waiting_for_approval` — asking the user to approve a concrete mutating scope.
- `applying` — executing an already-approved change scope.
- `completed` — work is done, approved changes were applied, or a non-mutating request was answered.
- `blocked` — unable to continue without input, access, dependencies, credentials, or approval.

## Standard sections

Use relevant sections in this order when practical:

```text
Status: <status>

Summary:
- <short outcome or current state>

Findings:
- <facts discovered during inspection>

Assumptions:
- <assumptions being made>

Questions:
- <questions that block or improve the work>

Options:
- <stable option id>: <selectable option summary>
  - Scope: <what this option includes>
  - Tradeoffs: <important pros, cons, risks, or constraints>

Recommended option:
- <stable option id>, because <reason>

Proposed changes:
- <specific files, commands, or behavior changes being proposed>

Approval required:
- <yes/no>
- Scope: <what approval would allow>

Next actions:
- <stable action id>: <action the user or UI can select next>

References:
- File: <relevant file path>
- Command: <relevant command>
- Artifact: <relevant log, report, generated output, external doc, or other reference>

Applied:
- <changes made>

Validated:
- <checks run and results>

Skipped:
- <checks, planned changes, or optional work skipped and why>

Remaining:
- <follow-up work, risks, unresolved issues, or optional improvements>
```

## Core rules

- Include only relevant sections, but preserve section names exactly when included.
- Keep `Status:` as the first line.
- Use bullets for entries so humans can scan them and a UI can split them reliably.
- Prefer concise bullets, but include all material facts, assumptions, risks, validation results, blockers, and decisions. Do not hide detail for brevity.
- Prefer standard sections over inventing new section names. Put domain-specific details inside the closest matching standard section.
- Use `References:` for files, commands, artifacts, logs, reports, generated outputs, or external docs a UI may link to.
- For long logs or verbose output, include key details inline and reference the exact command, file, artifact, or log location for full detail.

## Visual separation

- Separate major sections with a blank line.
- Keep section headings on their own line using the exact standard heading text, such as `Summary:` or `Next actions:`.
- Do not merge multiple standard sections into one paragraph.
- Keep bullets as short as practical without omitting information that could materially affect decisions, risks, validation, approval, or next actions.
- For long or complex responses, use `---` between major groups only when it improves readability.
- Do not use decorative dividers in short responses.
- UI renderers may treat each standard section as a separate card, panel, or collapsible block.

## Options and actions

- Use `Options:` for multiple selectable paths, design choices, tradeoffs, or brainstorming outcomes.
- Give each option a stable ID such as `A`, `B`, `C`, or a short slug.
- Include `Recommended option:` when one path is preferred. Omit it only when genuinely neutral or when the user asked for options without a recommendation.
- Use `Next actions:` for selectable follow-ups such as approving, revising, exploring, answering, cloning, branching, naming, or resuming.
- Give next actions stable IDs when practical, such as `approve-option-a`, `revise-proposal`, `explore-option-b`, or `clone-option-b`.
- For rabbit-hole learning or exploration, use the Pi branching guidance below.
- Rabbit-hole prompts should say what to explain or explore, which prior context matters, and whether edits are allowed.
- If a next action requires approval, say so in the action text or in `Approval required:`.

## Approval and completion

- Use `Approval required:` whenever proposing mutating work.
- Do not put proposed work under `Applied:`.
- Do not put validation commands under `Applied:`; use `Validated:` or `Skipped:`.
- Put failed validation commands under `Validated:` with the command, result, and material error details.
- Put unresolved fixes or follow-up work under `Remaining:`.
- Use `Skipped:` for skipped checks, skipped planned changes, or skipped optional work. Always include the reason.
- If nothing was changed, omit `Applied:` or explicitly state `Applied: None.` for no-op or already-done cases when that distinction matters.

## Pi branching guidance

Pi already saves sessions and supports cloning/branching, so use `Next actions:` to protect the main thread by cloning before exploring rabbit holes.

For rabbit holes, include the exact commands needed to mark the current context, clone it, start the rabbit-hole prompt, and return to the original context:

```text
Next actions:
- mark-current-context: Type `/session` to show the current session ID/file, then optionally type `/name main-<topic>` so it is easy to find later.
- clone-for-rabbit-hole: Type `/clone` to duplicate the current context into a new session, then type `/name rabbit-hole-<topic>`.
- start-rabbit-hole: Ask: "<focused learning/exploration prompt>. Do not edit files unless I explicitly approve."
- return-to-main: Type `/resume` and select `main-<topic>`, or restart Pi with `pi --session <session-id>` if you saved the ID.
```

For complex rabbit holes, include the needed focused summary inside the `start-rabbit-hole` prompt instead of adding a separate continuation section.

## Common mappings

- Simple answer or no-op: `Status: completed` with `Summary`, `Findings`, and optionally `Remaining` or `Applied: None.`
- Brainstorming or options: `Status: proposing` with `Options`, optional `Recommended option`, and `Next actions`.
- Mutating proposal before approval: `Status: waiting_for_approval` with `Proposed changes` and `Approval required`.
- Approved work completed: `Status: completed` with `Applied`, `Validated`, `Skipped`, and `Remaining` as relevant.
- Approved work applied but validation failed: `Status: completed`; failed checks go in `Validated`, follow-up goes in `Remaining`.
- Missing required input, access, dependency, credential, or approval: `Status: blocked` with `Questions`, `Next actions`, and `Remaining` as relevant.
