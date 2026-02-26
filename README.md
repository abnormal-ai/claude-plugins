# claude-plugins

Claude Code plugins by Abnormal AI -- explore engineering roles, bootstrap spec-driven development, and build with our public tools.

## Add the marketplace

```
/plugin marketplace add abnormal-ai/claude-plugins
```

## Plugins

### careers-abnormal-ai

Explore engineering roles at Abnormal AI that match your interests and stack.

```
/plugin install careers-abnormal-ai@abnormal-ai
```

Then run `/careers-abnormal-ai`.

### spec-tool

Bootstrap any monorepo with spec-driven development infrastructure. Generates `.ai-dev/` knowledge files (ARCHITECTURE.md, SECURITY.md, LEGAL.md), a planning template, plan review agent, and CLI wrapper (`bin/plan`).

```
/plugin install spec-tool@abnormal-ai
```

Then run `/build-spec-tool` in any repo. The tool will:
1. Explore your codebase to understand tech stack, architecture, and conventions
2. Optionally interview you about security policies, compliance, and process
3. Generate customized `.ai-dev/` files reflecting your actual patterns
4. Create a `bin/plan` shell wrapper for launching planning sessions
5. Install a plan review agent that validates plans against your standards
