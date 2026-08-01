# ai_skills

Personal AI agent skills and workflows for coding assistants.

## Skills

- [`project-standards-setup`](skills/project-standards-setup/SKILL.md) — configure language-specific project standards, naming conventions, deterministic tooling, pre-commit hooks, VS Code/Dev Containers, README tasks with `xc`, and licensing.
- [`suggestion-first-changes`](skills/suggestion-first-changes/SKILL.md) — make AI agents default to suggestions and plans instead of editing files unless explicitly asked.

## Always-on safety instructions

Skills are usually loaded on demand. That means a skill is not the right place for rules that must apply to every interaction.

For the suggestion-first policy, use both:

1. the [`suggestion-first-changes`](skills/suggestion-first-changes/SKILL.md) skill, for detailed behavior when relevant
2. `AGENTS.md` / `CLAUDE.md` context instructions, so agents see the policy at startup

This repo includes:

- [`AGENTS.md`](AGENTS.md) — shared always-on instructions for Pi, Codex-style agents, and other agents that read `AGENTS.md`
- [`CLAUDE.md`](CLAUDE.md) — Claude-style context file that points to `AGENTS.md`

### Install always-on instructions globally

From this repo:

```bash
# Pi global context
mkdir -p ~/.pi/agent
cp AGENTS.md ~/.pi/agent/AGENTS.md

# Shared/Codex-style global context, if supported by your agent
mkdir -p ~/.codex
cp AGENTS.md ~/.codex/AGENTS.md

# Claude-style global context, if supported by your setup
mkdir -p ~/.claude
cp CLAUDE.md ~/.claude/CLAUDE.md
```

If those files already exist, do not blindly overwrite them. Merge the suggestion-first policy into the existing file instead.

### Install always-on instructions into a project

From a project root, replacing `/path/to/ai_skills` with this repo path:

```bash
cp /path/to/ai_skills/AGENTS.md ./AGENTS.md
cp /path/to/ai_skills/CLAUDE.md ./CLAUDE.md
```

Or symlink them so updates in this repo are reflected:

```bash
ln -sfn /path/to/ai_skills/AGENTS.md ./AGENTS.md
ln -sfn /path/to/ai_skills/CLAUDE.md ./CLAUDE.md
```

## Use these skills with Pi

Pi discovers skills from several locations, including:

- `~/.pi/agent/skills/`
- `~/.agents/skills/`
- project-local `.pi/skills/`
- project-local `.agents/skills/`
- explicit `--skill <path>` arguments

### Recommended: symlink this repo into Pi's global skills

From this repo:

```bash
mkdir -p ~/.pi/agent/skills
ln -sfn "$(pwd)/skills/project-standards-setup" ~/.pi/agent/skills/project-standards-setup
ln -sfn "$(pwd)/skills/suggestion-first-changes" ~/.pi/agent/skills/suggestion-first-changes
```

Then restart Pi. The skills should be available automatically when the task matches. For the suggestion-first policy, also install `AGENTS.md` globally or in the project so the rule is present at startup.

You can manually load skills with:

```text
/skill:project-standards-setup
/skill:suggestion-first-changes
```

### Alternative: use the shared Agent Skills location

This can be useful if multiple agents support the Agent Skills layout:

```bash
mkdir -p ~/.agents/skills
ln -sfn "$(pwd)/skills/project-standards-setup" ~/.agents/skills/project-standards-setup
ln -sfn "$(pwd)/skills/suggestion-first-changes" ~/.agents/skills/suggestion-first-changes
```

### Project-local install

To make the skills available only inside a specific project, run this from that project root, replacing `/path/to/ai_skills` with this repo path:

```bash
mkdir -p .agents/skills
ln -sfn /path/to/ai_skills/skills/project-standards-setup .agents/skills/project-standards-setup
ln -sfn /path/to/ai_skills/skills/suggestion-first-changes .agents/skills/suggestion-first-changes
```

Or for Pi-specific project skills:

```bash
mkdir -p .pi/skills
ln -sfn /path/to/ai_skills/skills/project-standards-setup .pi/skills/project-standards-setup
ln -sfn /path/to/ai_skills/skills/suggestion-first-changes .pi/skills/suggestion-first-changes
```

### Load explicitly for one Pi session

```bash
pi --skill "$(pwd)/skills/project-standards-setup" --skill "$(pwd)/skills/suggestion-first-changes"
```

## Use with other agents

This repo uses the Agent Skills-style layout:

```text
skills/
  project-standards-setup/
    SKILL.md
  suggestion-first-changes/
    SKILL.md
```

For other agents, use whichever skill directory they support and symlink the skill folders into it.

Common examples:

```bash
# Shared Agent Skills location
mkdir -p ~/.agents/skills
ln -sfn "$(pwd)/skills/project-standards-setup" ~/.agents/skills/project-standards-setup
ln -sfn "$(pwd)/skills/suggestion-first-changes" ~/.agents/skills/suggestion-first-changes

# Claude-style skills directory, if used by your setup
mkdir -p ~/.claude/skills
ln -sfn "$(pwd)/skills/project-standards-setup" ~/.claude/skills/project-standards-setup
ln -sfn "$(pwd)/skills/suggestion-first-changes" ~/.claude/skills/suggestion-first-changes

# Codex-style skills directory, if used by your setup
mkdir -p ~/.codex/skills
ln -sfn "$(pwd)/skills/project-standards-setup" ~/.codex/skills/project-standards-setup
ln -sfn "$(pwd)/skills/suggestion-first-changes" ~/.codex/skills/suggestion-first-changes
```

Restart the agent after adding or changing skills or context files so it can rediscover them.

## Verify the skill file

Each skill should start with frontmatter like this:

```yaml
---
name: skill-name
description: ...
---
```

Pi uses the `description` to decide when to load the skill, so keep it specific and keyword-rich.
