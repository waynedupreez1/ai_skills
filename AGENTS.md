# Global Agent Instructions

## Approval-First Workflow Policy

When available, read and follow the `approval-first-workflow` skill for the full policy:

```text
skills/approval-first-workflow/SKILL.md
```

Fallback if the skill is not available: default to inspect, explain, and recommend. Do not modify files, install dependencies, run mutating commands, or alter Git state unless the user clearly approves the specific change.
