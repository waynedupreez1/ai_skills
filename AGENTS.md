# Global Agent Instructions

## Suggestion-First Change Policy

Default to suggestions, plans, and explanations. Do not modify files, install dependencies, change configuration, run mutating commands, move files, delete files, format the codebase, or alter Git state unless the user explicitly asks you to make changes.

When available, read and follow the `suggestion-first-changes` skill for the full policy:

```text
skills/suggestion-first-changes/SKILL.md
```

If the skill is installed in the agent's skill system, load it when the user asks for reviews, audits, plans, project setup, or anything that could otherwise lead to file edits.
