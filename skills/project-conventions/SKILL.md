---
name: project-conventions
description: Audit or plan repository conventions on request. Use when explicitly asked to standardize a repo, set up project conventions, or plan formatter/linter/typecheck/test commands, hooks, editor/container config, README tasks, CI recommendations, or licensing.
disable-model-invocation: true
---

# Project Conventions

Use when the user explicitly asks to standardize, bootstrap, or audit a software project.

## Inspect for

- language/framework/build system/package manager
- existing formatter, linter, type checker, test runner, scripts/tasks
- existing README tasks, especially `xc`
- pre-commit/hook tooling
- editor/dev environment config: `.vscode/`, `.devcontainer/`, Docker files
- CI config
- dependency/security update tooling, ignore files, and secret scanning config
- license files and package metadata
- current layout and naming conventions

## Principles

- Preserve existing conventions unless the user asks to replace them.
- Prefer boring, ecosystem-standard tools.
- Recommend industry-standard naming conventions for the detected languages, frameworks, and tools.
- Make standards deterministic with commands/config, not prose only.
- For unfamiliar or fast-changing ecosystems, check current best practices before recommending tools.

## Standard recommendations

For the detected ecosystem, recommend the minimal set needed for:

- formatting
- linting
- type checking, if applicable
- tests
- integration/end-to-end testing conventions relevant to detected technologies
- a combined verification command
- pre-commit hooks that run relevant validation before commit
- optional README tasks with `xc`
- optional VS Code settings/extensions
- optional Dev Container setup
- documentation conventions/tools relevant to detected technologies
- basic security/dependency hygiene when relevant
- licensing files/metadata when relevant
- naming/layout conventions based on detected languages, frameworks, and tools

Use this command shape when practical:

```text
format
lint
typecheck
test
check
```

`check` should be suitable for local development and CI.

## Pre-commit hooks

When project conventions include validation commands, recommend hooks that run relevant fast checks before commit.

Hooks should reuse project commands where practical, usually `format`/format-check, `lint`, `typecheck`, `test`, or `check`. Avoid slow or environment-dependent checks unless the user requests them.

Also include basic file hygiene checks where practical, especially YAML syntax validation, JSON syntax validation, trailing whitespace, final newline/end-of-file fixes, and merge conflict marker checks.

## Integration and end-to-end testing

Recommend integration or end-to-end testing only when relevant to the detected project type.

Examples:

- Ansible roles/collections may use Molecule for scenario testing.
- Web applications may use framework-appropriate browser/end-to-end tools.
- Infrastructure projects may use validation, plan, lint, and policy tests appropriate to the tool.
- Libraries and services may need integration tests around public APIs, CLIs, databases, or network boundaries.

Prefer test commands that can run locally and in CI. Separate slow, external-service, or environment-dependent tests from the default fast `check` command unless the user wants full validation by default.

## Documentation conventions

Recommend documentation conventions only when relevant to the detected repository contents.

Examples of technology-specific documentation conventions:

- Ansible repos may benefit from README guidance for generated role/playbook docs, such as Docsible when appropriate.
- Terraform repos may benefit from README guidance for generated module documentation when modules are present.
- Go repos with public APIs should follow GoDoc-compatible package, exported type, function, and method comments.
- Libraries/framework packages may need README usage examples and API documentation for reusable interfaces.

Prefer documenting how to run/update docs in existing project commands, README tasks, or CI. Do not introduce documentation generators for technologies that are not present.

## Naming conventions

Recommend naming conventions that match the detected ecosystem, including file names, directories, modules/packages, functions, variables, types/classes, constants, tests, and framework-specific conventions.

Do not apply naming rules from one ecosystem to another. Preserve existing naming patterns unless they conflict with common conventions or the user asks to standardize them.

## Licensing

Treat licensing as a project-standard topic, not legal advice.

If intent is unclear, ask whether the project should be permissive open source, copyleft/open source, source-available/non-commercial, dual-licensed, or private/proprietary.

## Response pattern

Use `ui-friendly-response` when available for response formatting. This skill only defines the repository-conventions semantics that the response must communicate.

Convention audits and plans must clearly communicate:

- detected stack, tools, package managers, frameworks, and project layout
- existing standards and commands already present
- gaps or inconsistencies in formatting, linting, type checking, testing, hooks, docs, editor/container config, CI, licensing, security hygiene, and naming/layout
- recommended minimal standards and why they fit the detected ecosystem
- files or configuration that would be added or updated
- commands that would be added, changed, or run
- risks, churn, or compatibility concerns

When multiple viable standards or tooling choices exist, present them as selectable options using `ui-friendly-response` rather than forcing a single path without explanation.

When proposed convention changes would mutate the workspace, follow `approval-first-workflow`.

## Completion

After changes, validate every standards command that was added or changed, unless blocked by missing dependencies, credentials, external services, or prohibitive runtime.

Also validate hook configuration when hooks are added or changed.

Completion summaries must clearly communicate:

- files changed
- standards added or preserved
- validation commands run and results
- validation commands skipped and why
- remaining optional improvements
