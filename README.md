# ai_skills

Personal AI agent instructions, skills, and workflow conventions for coding assistants.

## Repository contents

| Path | Purpose |
| --- | --- |
| `AGENTS.md` | Global always-on instructions for agents. Currently points agents to the approval-first workflow. |
| `CLAUDE.md` | Claude-specific entrypoint that delegates to `AGENTS.md`. |
| `skills/approval-first-workflow/SKILL.md` | Skill that requires agents to inspect, propose, and wait for approval before modifying a workspace. |
| `skills/project-conventions/SKILL.md` | Skill for auditing or planning repository standards such as formatters, linters, tests, hooks, docs, editor/container config, and naming conventions. |
| `skills/ui-friendly-response/SKILL.md` | Skill that defines a consistent, human-readable, UI-renderable response pattern with stable sections, statuses, options, actions, references, and continuation context. |
| `.devcontainer/` | Development container setup for working on this repo in a consistent environment. |
| `LICENSE` | MIT license for this repository. |

## Available skills

| Skill | Purpose |
| --- | --- |
| [`approval-first-workflow`](skills/approval-first-workflow/SKILL.md) | Make agents default to suggestions/plans instead of editing files unless explicitly approved. |
| [`project-conventions`](skills/project-conventions/SKILL.md) | Audit or plan project conventions, tooling, hooks, documentation, naming/layout, and related repo standards. |
| [`ui-friendly-response`](skills/ui-friendly-response/SKILL.md) | Standardize human-readable responses for future UI rendering, including statuses, selectable options, next actions, references, validation summaries, and context for branching into new sessions. |

## Recommended setup

Use **copying**, not symlinking. This works better with Dev Containers and avoids path issues between host and container filesystems.

Prefer the shared Agent Skills location:

```text
~/.agents/skills/
```

For best results, install both:

1. **Always-on instructions** via `AGENTS.md`
2. **Skills** via `~/.agents/skills/`

The always-on file gives agents the core approval-first rule at startup. The skills provide detailed workflows when loaded.

## Skill relationships

- `ui-friendly-response` defines the shared human/UI response pattern.
- `approval-first-workflow` defines approval semantics and uses `ui-friendly-response` for formatting when available.
- `project-conventions` defines repository standards semantics and uses `ui-friendly-response` for formatting when available.

## Validation and pre-commit hooks

This repo uses [`pre-commit`](https://pre-commit.com/) for Markdown and file hygiene checks without making the repo a Python or JavaScript project.

Install pre-commit with your preferred tool, for example:

```bash
pipx install pre-commit
```

Install the Git hook from this repo:

```bash
pre-commit install
```

Run all checks manually:

```bash
pre-commit run --all-files
```

Current checks include Markdown linting, trailing whitespace, final newline, YAML/JSON syntax, merge conflict markers, and large-file checks. If this repo later grows JavaScript/TypeScript UI tooling or Python validation scripts, pre-commit can run those commands too.

## 1. Install always-on instructions

`AGENTS.md` tells agents to default to suggestions and not change files unless explicitly approved.

From this repo:

```bash
mkdir -p ~/.agents
cp AGENTS.md ~/.agents/AGENTS.md
```

For a specific project, copy it into the project root:

```bash
cp /path/to/ai_skills/AGENTS.md ./AGENTS.md
```

## 2. Install skills globally

From this repo:

Or copy all skills at once:

```bash
mkdir -p ~/.agents/skills
cp -R skills/* ~/.agents/skills/
```

Restart your agent after copying.

## 3. Install skills for one project only

Use this when you want the skills available only inside one repo.

From the target project root, replacing `/path/to/ai_skills` with this repo path:

Or copy all skills at once:

```bash
mkdir -p .agents/skills
cp -R /path/to/ai_skills/skills/* .agents/skills/
```

Restart your agent after copying.

## Manual skill loading

Some agents support explicit skill loading for a single session. Use the paths in this repo if your agent supports that mode:

```text
/path/to/ai_skills/skills/approval-first-workflow
/path/to/ai_skills/skills/project-conventions
/path/to/ai_skills/skills/ui-friendly-response
```
