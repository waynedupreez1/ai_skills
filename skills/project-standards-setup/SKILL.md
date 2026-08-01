---
name: project-standards-setup
description: Configure language-specific project standards for software repos. Use when setting up or auditing naming conventions, folder layout, formatters, linters, type checking, tests, deterministic check commands, pre-commit hooks, VS Code settings, Dev Containers, README tasks with xc, CI recommendations, or licensing. Always inspect first and ask before modifying existing project behavior.
---

# Project Standards Setup

Use this skill when a user wants to configure a software project with language- or framework-specific industry standards, including naming conventions, folder layout, formatting, linting, type checking, testing, deterministic check commands, pre-commit hooks, VS Code settings, Dev Containers, README tasks, licensing, documentation, and baseline automation.

## Goal

Help establish practical, idiomatic project conventions without disrupting existing work. Prefer widely adopted defaults for the detected ecosystem, and make recommendations explicit before applying broad structural changes.

## When to Use

Use this skill when the user asks to:

- set up project conventions
- standardize a repo
- configure naming conventions
- add formatter/linter/type-checker/test tooling
- add deterministic project check commands
- add pre-commit hooks
- configure VS Code or Dev Containers
- add README tasks using `xc`
- configure project licensing
- create a conventional project structure
- align a project with industry standards
- bootstrap a new project using best practices
- audit an existing repo for convention gaps

## Trigger Phrases

This skill is relevant when the user mentions phrases like:

- project standards
- industry standards
- naming conventions
- repo setup
- project bootstrap
- formatter/linter/test setup
- ESLint, Prettier, Ruff, pytest, Vitest, `svelte-check`, `gofmt`
- pre-commit hooks, Husky, lint-staged, Lefthook
- VS Code settings, recommended extensions, Dev Containers, `.devcontainer`
- README tasks, `xc`, `format`, `lint`, `typecheck`, `test`, `check`
- license, licensing, AGPL, GPL, non-commercial, source-available, dual license

## Operating Principles

1. **Detect first**
   - Inspect files before suggesting changes.
   - Identify language, framework, package manager, build system, and test framework.
   - Look for existing standards before adding new ones.

2. **Do not overwrite existing conventions casually**
   - If the repo already has formatter/linter/test config, preserve it unless the user asks to replace it.
   - If conventions conflict, explain the tradeoff and ask before changing.

3. **Prefer boring, common standards**
   - Choose defaults that are broadly accepted in the ecosystem.
   - Avoid exotic tooling unless the project already uses it or the user requests it.

4. **Be language-specific**
   - Naming, folder layout, linting, formatting, and testing standards should match the project language/framework.

5. **Make standards enforceable**
   - Prefer config files and scripts over documentation-only rules.
   - Add commands for formatting, linting, and testing where appropriate.

6. **Explain what changed**
   - Summarize added/changed files.
   - Include commands the user can run locally.

## Non-Destructive Change Policy

This skill must not behave like an automatic repo rewriter. The default mode is **inspect, recommend, then ask** before changing anything significant.

### Safe without explicit approval

These actions are usually safe when they support the user's request:

- reading files and inspecting repository structure
- running non-mutating discovery commands such as `ls`, `find`, `rg`, dependency inspection, or version checks
- reporting detected language, framework, tools, and conventions
- proposing standards, folder layouts, naming conventions, and tooling choices
- creating a new documentation file or standards proposal when the user explicitly asked for one

### Ask before changing

Ask for confirmation before:

- editing existing source files
- editing existing config files
- adding or replacing formatter, linter, type checker, test, build, package manager, pre-commit hook, dev container, editor, license, or CI configuration
- adding dependencies or changing package manifests/lockfiles
- changing naming conventions in existing code
- moving, renaming, or reorganizing files/folders
- applying formatters across the codebase
- making changes that could create large diffs

### Never do without explicit approval

Do not do these unless the user clearly approves the specific action:

- delete files or directories
- perform broad refactors
- rewrite project architecture
- replace established tooling
- change public APIs
- run destructive shell commands
- auto-fix lint/format issues across the whole project

### Approval pattern

For existing projects, present a plan before edits:

```text
I found the current standards/tooling: ...
I recommend these changes: ...
These changes are low risk: ...
These changes need your approval: ...
Should I apply them?
```

## Initial Assessment Checklist

Before editing, inspect for:

- language indicators: `package.json`, `pyproject.toml`, `go.mod`, etc.
- framework indicators: SvelteKit, Svelte, Next.js, React, Vue, Django, FastAPI, Flask, etc.
- existing tooling: `.editorconfig`, ESLint, Prettier, Ruff, Black, golangci-lint, etc.
- package manager: npm, pnpm, yarn, uv, Poetry, pip, Go modules
- test framework: pytest, unittest, Jest, Vitest, Go test
- CI configuration: GitHub Actions, GitLab CI, CircleCI, Azure Pipelines
- licensing files and metadata: `LICENSE`, `NOTICE`, package manifest license fields, README license section
- pre-commit tooling: `pre-commit`, Husky, lint-staged, Lefthook, Overcommit, Git hooks
- editor/dev environment configuration: `.vscode/`, `.devcontainer/devcontainer.json`, `Dockerfile`, `docker-compose.yml`, `.env.example`
- existing project layout and naming conventions

## Clarifying Questions

Ask only when needed. Useful questions include:

- Is this a new project or an existing project?
- Which language/framework should the standards target?
- Do you want minimal defaults or stricter enterprise-style standards?
- Should I add tooling configs only, or also reorganize files?
- Which package manager should be used?
- Should CI configuration be added?
- What license intent does the project need: permissive open source, strong copyleft, network copyleft, non-commercial/source-available, or private/proprietary?
- Should pre-commit hooks be added to run standards checks before commits?
- Should VS Code settings and a Dev Container be added or updated?
- Should the Dev Container install project tools automatically, or only document them?

## Standard Deliverables

Depending on project type, propose or create:

- `.editorconfig`
- formatter config
- linter config
- type checker config where appropriate
- test framework config
- deterministic check commands that can be run locally, in Dev Containers, in pre-commit hooks, and in CI
- package/build scripts or README task definitions for `format`, `lint`, `test`, `check`, and optionally `typecheck`
- `xc` task runner support when the user prefers README-defined tasks
- pre-commit hook configuration to run fast standards checks before commit
- licensing recommendation and setup, including `LICENSE`, package metadata, and README notes
- VS Code workspace recommendations where appropriate, such as extensions, default formatter, format-on-save, lint-on-save, and test integration
- Dev Container configuration where appropriate, such as `.devcontainer/devcontainer.json`, Dockerfile/image choice, features, post-create commands, and forwarded ports
- `.gitignore`
- README section documenting project commands, conventions, hooks, and development environment setup
- example folder structure
- optional CI workflow

## Deterministic Standards Enforcement

Standards should not rely on the agent's judgment alone. When practical, propose deterministic tools that can check or enforce conventions repeatedly on any machine.

For each detected ecosystem, prefer a small, standard toolchain with commands or README tasks for:

- **format**: automatically format code
- **lint**: detect style, correctness, and maintainability issues
- **typecheck**: validate types when the language/tooling supports it
- **test**: run the automated test suite
- **check**: run the default combined verification command for local development and CI

Recommended command pattern:

```text
format    # write formatting changes
lint      # check lint rules
typecheck # check static types, if applicable
test      # run tests
check     # run lint + typecheck + test, and optionally format check
```

Keep these commands deterministic, documented, and runnable without AI involvement.

## Licensing Standards

When configuring project standards, include licensing as a first-class project configuration topic.

Important: do not present licensing guidance as legal advice. Recommend that the user consult a qualified lawyer for business-critical licensing decisions.

### License intent questions

Ask what the user wants the license to achieve:

- Should the project be truly open source under the OSI definition?
- Should companies be allowed to use it commercially?
- Should modified versions have to publish source code?
- Should network/SaaS use also require source sharing?
- Should the project be source-available but not commercially exploitable without permission?
- Does the user want dual licensing, e.g. free for community use but paid for commercial use?

### Common recommendations

- **Permissive open source**: MIT, Apache-2.0, BSD. Easy adoption, but companies can use and monetize with few obligations.
- **Strong copyleft open source**: GPL-3.0. Allows commercial use, but distributed derivatives generally must share source under the same license.
- **Network copyleft open source**: AGPL-3.0. Similar to GPL, but also targets software provided over a network/SaaS. Often the best open-source option when the user wants to prevent closed-source SaaS exploitation.
- **Source-available / non-commercial**: PolyForm Noncommercial, Business Source License, or a custom commercial license. Better when the user explicitly wants to prevent corporate commercial exploitation, but these are generally not OSI open-source licenses.
- **Documentation/content**: Creative Commons licenses may apply to docs/content, but avoid using CC licenses for software code unless there is a specific reason.

### Guidance for “corporations should not steal and make money”

Clarify the tradeoff:

- If the user wants an **open-source license**, recommend AGPL-3.0 for maximum reciprocal protection, while noting it still permits commercial use if license obligations are followed.
- If the user wants to **block commercial use without permission**, recommend a source-available/non-commercial license or dual-license model, while noting it is not standard open source.
- If the user wants companies to pay for closed/commercial use, suggest dual licensing: AGPL-3.0 for the public version plus a separate paid commercial license.

### Standard licensing deliverables

Depending on project needs, propose or create:

- `LICENSE`
- `NOTICE` when appropriate
- README license section
- package metadata license field, e.g. `package.json`, `pyproject.toml`
- file headers only when the project convention requires them
- contributor/license notes if accepting external contributions

Do not change or replace a project's license without explicit approval.

## README Tasks with `xc`

If the user uses [`xc`](https://github.com/joerdav/xc) as a README-based task runner, include it in the project standards proposal.

`xc` guidance:

- Define common development tasks in `README.md` instead of, or alongside, package-manager-specific scripts.
- Prefer task names that match the standard command pattern: `format`, `lint`, `typecheck`, `test`, and `check`.
- Keep tasks deterministic and suitable for local development, Dev Containers, pre-commit hooks, and CI.
- Use existing package/build commands inside `xc` tasks rather than duplicating complex logic.
- Document how to install `xc`, list tasks, and run tasks.
- Do not rewrite an existing README task structure without approval.

Preferred README task format:

````markdown
## test

Run tests via vitest

```bash
npm run test
```
````

For a standards setup, create similar README task sections such as:

- `## format`
- `## lint`
- `## typecheck`
- `## test`
- `## check`

When Dev Containers are used, propose installing `xc` in the container if it is not already available. For Linux containers, the user commonly installs it with an architecture-aware download step similar to:

```dockerfile
RUN arch=$(uname -m) && \
    if [ "$arch" = "aarch64" ]; then arch="arm64"; fi && \
    echo "Detected architecture: $arch" && \
    curl -L -o /tmp/xc.tar.gz https://github.com/joerdav/xc/releases/download/v0.9.0/xc_0.9.0_linux_$arch.tar.gz && \
    tar -xzf /tmp/xc.tar.gz -C /usr/local/bin/ && \
    chmod +x /usr/local/bin/xc && \
    xc -complete
```

A standards proposal should include:

```text
README task recommendation:
- Task runner: xc
- Tasks: format, lint, typecheck, test, check
- Install location: local docs / Dev Container / CI
- Example command: xc check
```

## VS Code and Dev Containers

When the user develops in VS Code with Dev Containers, include editor and container configuration as part of project standards.

### VS Code guidance

Propose `.vscode/` settings when useful, but ask before adding or changing them in an existing project.

Common recommendations:

- `.vscode/extensions.json` with recommended extensions for the detected language/framework
- `.vscode/settings.json` for default formatter, format-on-save, lint-on-save, test discovery, and TypeScript/Python/Go SDK settings
- avoid overly personal editor preferences such as theme, font, minimap, or UI layout
- keep workspace settings focused on reproducible project behavior

### Dev Container guidance

Propose `.devcontainer/devcontainer.json` when the project benefits from a reproducible development environment.

Common recommendations:

- choose a maintained base image or Dev Container Feature appropriate for the language/runtime
- install project tooling needed for `format`, `lint`, `typecheck`, `test`, `check`, README tasks, and pre-commit hooks
- install `xc` when README-defined tasks are part of the project standard
- use `postCreateCommand` or documented setup commands for dependency installation and hook setup
- forward common framework ports where relevant
- mount or configure caches only when useful and non-surprising
- include VS Code extensions/settings inside the dev container when they are project-specific
- document how to open the project in the container and run checks

Do not add or alter Dev Container configuration without approval, because it can change how dependencies, tools, ports, and local development workflows behave.

A standards proposal should include:

```text
Development environment recommendation:
- VS Code settings/extensions: ...
- Dev Container: yes/no, because ...
- Base image/features: ...
- Tools installed in container: ...
- postCreateCommand: ...
- Ports: ...
```

## Recommended Tooling by Ecosystem

Use existing tooling if present. If tooling is missing, propose these defaults unless the user requests something else:

### Python

- formatting/linting: Ruff for modern Python projects; Black + isort + Flake8 are acceptable if already established
- type checking: pyright by default, or mypy when preferred/existing
- testing: pytest
- hooks: `pre-commit` with Ruff, type checking if fast enough, and basic file hygiene hooks

### JavaScript / TypeScript

- linting: ESLint
- formatting: Prettier, or framework/tooling formatter if already established
- type checking: `tsc --noEmit` for TypeScript projects
- testing: Vitest or Jest, following existing framework conventions
- hooks: Husky + lint-staged for npm/pnpm/yarn projects, or `pre-commit` if the repo is multi-language

#### Svelte / SvelteKit

When the project uses Svelte or SvelteKit, prefer the framework-standard tooling:

- linting: ESLint with Svelte support, using the Svelte-recommended config where available
- formatting: Prettier with `prettier-plugin-svelte`
- type checking: `svelte-check`, usually via the `check` script generated by SvelteKit
- testing: Vitest for unit tests; Playwright for browser/end-to-end tests when needed
- package scripts: include `format`, `lint`, `check`, and `test` using the existing Svelte/SvelteKit script conventions
- VS Code: recommend the official Svelte extension and configure Prettier/Svelte formatting only as project settings
- hooks: run fast checks such as Prettier check, ESLint, and `svelte-check`; avoid slow full browser tests on every commit unless requested

### Go

- formatting: `gofmt`
- linting/checking: `go vet`, optionally `golangci-lint`
- testing: `go test ./...`
- hooks: `pre-commit` or Lefthook running `gofmt`/`go vet`/targeted tests

## Pre-Commit Hooks

When setting up standards, propose pre-commit hooks so checks run before code is committed.

Pre-commit hook guidance:

- Keep hooks fast enough that developers will tolerate them.
- Run format checks, lint checks, and targeted type checks where practical.
- Avoid running very slow full integration suites before every commit unless requested.
- Prefer project-standard hook tooling for the ecosystem.
- Document how to install, run, bypass in emergencies, and update hooks.
- Do not install or activate hooks without approval, because this changes developer workflow.

Common options:

- **Python or multi-language repos**: `pre-commit` with `.pre-commit-config.yaml`
- **JavaScript/TypeScript repos**: Husky + lint-staged, or Lefthook for a language-agnostic option
- **Go/polyglot repos**: `pre-commit` or Lefthook

A standards proposal should include:

```text
Pre-commit recommendation:
- Tool: ...
- Hooks: ...
- Install command: ...
- Manual run command: ...
- Expected runtime: ...
```

## Naming Convention Guidance

Apply ecosystem-specific conventions:

### General

- Prefer clear, descriptive names over abbreviations.
- Keep naming consistent within the repo.
- Use domain language where possible.
- Avoid names like `utils`, `helpers`, or `common` unless the contents are genuinely cross-cutting.
- Use feature/module-oriented names where the ecosystem supports it.

### Python

- packages/modules: `snake_case`
- functions/variables: `snake_case`
- classes: `PascalCase`
- constants: `UPPER_SNAKE_CASE`
- tests: `test_*.py` or `*_test.py`, with pytest usually favoring `test_*.py`
- common tooling: Ruff, Black-compatible formatting via Ruff, pytest, mypy/pyright when type checking is desired
- common layout: `src/<package_name>/` for libraries; flatter app layout may be acceptable for small services

### JavaScript / TypeScript

- files: choose one convention and apply consistently, commonly `kebab-case.ts` for general modules or framework-specific conventions where applicable
- variables/functions: `camelCase`
- classes/types/interfaces/components: `PascalCase`
- constants: `UPPER_SNAKE_CASE` for true constants, otherwise `camelCase`
- React components: `PascalCase`
- tests: `*.test.ts`, `*.spec.ts`, or colocated framework convention
- common tooling: ESLint, Prettier or formatter-integrated ESLint, TypeScript strict mode when feasible, Vitest/Jest depending on stack

#### Svelte / SvelteKit

- components: `PascalCase.svelte`, e.g. `UserCard.svelte`
- routes: follow SvelteKit filesystem routing conventions exactly, e.g. `+page.svelte`, `+layout.svelte`, `+server.ts`
- non-component modules: commonly `kebab-case.ts` or existing project convention
- stores/runes/state modules: use descriptive domain names rather than generic `store.ts` when possible
- server-only modules: follow SvelteKit conventions such as `.server.ts` where applicable
- tests: colocated `*.test.ts`/`*.spec.ts` or framework-established test folders
- common tooling: ESLint, Prettier with `prettier-plugin-svelte`, `svelte-check`, Vitest, and optionally Playwright

### Go

- packages: short, lowercase, no underscores
- files: lowercase, underscores acceptable where helpful, e.g. `user_service.go`
- exported identifiers: `PascalCase`
- unexported identifiers: `camelCase`
- tests: `*_test.go`
- common tooling: `gofmt`, `go vet`, `go test`, optionally `golangci-lint`
- common layout: avoid over-engineered layouts; use simple package structure unless project size warrants more

## Suggested Workflow

1. Inspect the repository using non-mutating commands.
2. Identify current language/framework/tooling.
3. Report detected stack and existing conventions.
4. Propose a standards plan.
5. Recommend deterministic tooling for formatting, linting, type checking, testing, README task running, pre-commit enforcement, and reproducible development environments.
6. Include `xc`, VS Code, and Dev Container recommendations when relevant.
7. Separate low-risk documentation changes from changes that affect project behavior.
8. Ask for confirmation before modifying existing files, adding tooling, adding hooks, adding/changing Dev Containers, changing licensing, moving files, installing dependencies, or making broad changes.
9. Apply only the approved changes.
10. Add commands/scripts only after approval when they affect existing project behavior.
11. Document standards, check commands, hook setup, and development environment setup in README or `docs/standards.md`.
12. Run validation commands if dependencies are available and the commands are non-destructive.
13. Summarize results and next steps.

## Example Response Pattern

When applying this skill, respond with:

```text
Detected stack:
- Language/framework: ...
- Package manager/build tool: ...
- Existing standards: ...

Recommended standards:
- Formatting: ...
- Linting: ...
- Type checking: ...
- Testing: ...
- Combined check command/task: ...
- README tasks / xc: ...
- Pre-commit hooks: ...
- VS Code/Dev Container: ...
- Licensing: ...
- Naming: ...
- Project layout: ...

Planned changes:
- Safe/recommended documentation changes: ...
- Changes that need approval: ...
- Files I would add/update: ...
- Commands I would run: ...
```

## Avoid

- Reorganizing large codebases without explicit approval.
- Introducing multiple competing tools for the same purpose.
- Applying one language's naming conventions to another ecosystem.
- Adding strict rules that will generate massive existing-code churn unless requested.
- Replacing existing project standards without explaining why.
- Adding personal editor preferences instead of project-level VS Code settings.
- Changing Dev Container images, features, ports, mounts, or setup commands without approval.
- Adding, changing, or replacing a license without explicit approval.

## Completion Criteria

The project should have:

- clear naming conventions for its language/framework
- formatter and linter configuration where practical
- a test command
- documented developer commands or README tasks
- documented `xc` setup when README task running is used
- documented pre-commit hook setup when hooks are used
- documented VS Code/Dev Container setup when project-specific editor/container config is used
- clear licensing files and metadata when licensing is part of the setup
- minimal but useful project structure guidance
- no unnecessary disruption to existing files
