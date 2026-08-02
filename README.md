# ai_skills

Personal AI agent skills and workflows for coding assistants.

## Available skills

| Skill | Purpose |
| --- | --- |
| [`project-standards-setup`](skills/project-standards-setup/SKILL.md) | Configure language-specific project standards: naming conventions, tooling, pre-commit hooks, VS Code, Dev Containers, `xc` README tasks, and licensing. |
| [`approval-first-workflow`](skills/approval-first-workflow/SKILL.md) | Make agents default to suggestions/plans instead of editing files unless explicitly approved. |

## Recommended setup

Use **copying**, not symlinking. This works better with Dev Containers and avoids path issues between host and container filesystems.

Prefer the shared Agent Skills location:

```text
~/.agents/skills/
```

This keeps the skills agent-agnostic instead of tying them to one tool.

For best results, install both:

1. **Always-on instructions** via `AGENTS.md`
2. **Skills** via `~/.agents/skills/`

The always-on file gives agents the core approval-first rule at startup. The skills provide detailed workflows when loaded.

---

## 1. Install always-on instructions

`AGENTS.md` tells agents to default to suggestions and not change files unless explicitly asked.

From this repo:

```bash
mkdir -p ~/.agents
cp AGENTS.md ~/.agents/AGENTS.md
```

For a specific project, copy it into the project root:

```bash
cp /path/to/ai_skills/AGENTS.md ./AGENTS.md
```

> If an `AGENTS.md` file already exists, merge the content manually instead of overwriting it.

---

## 2. Install skills globally

From this repo:

```bash
mkdir -p ~/.agents/skills

cp -R skills/project-standards-setup ~/.agents/skills/project-standards-setup
cp -R skills/approval-first-workflow ~/.agents/skills/approval-first-workflow
```

Restart your agent after copying.

---

## 3. Install skills for one project only

Use this when you want the skills available only inside one repo.

From the target project root, replacing `/path/to/ai_skills` with this repo path:

```bash
mkdir -p .agents/skills

cp -R /path/to/ai_skills/skills/project-standards-setup .agents/skills/project-standards-setup
cp -R /path/to/ai_skills/skills/approval-first-workflow .agents/skills/approval-first-workflow
```

Restart your agent after copying.

---

## Manual skill loading

Some agents support explicit skill loading for a single session. Use the paths in this repo if your agent supports that mode:

```text
/path/to/ai_skills/skills/project-standards-setup
/path/to/ai_skills/skills/approval-first-workflow
```

---

## Skill layout

This repo uses the Agent Skills-style folder layout:

```text
skills/
  project-standards-setup/
    SKILL.md
  approval-first-workflow/
    SKILL.md
```

Each `SKILL.md` starts with frontmatter:

```yaml
---
name: skill-name
description: ...
---
```

Agents use the `description` to decide when to load a skill, so descriptions should stay specific and keyword-rich.

## Updating installed skills

After editing this repo, rerun the relevant copy commands above and restart the agent.
