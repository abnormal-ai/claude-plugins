## Spec-Driven Development

This repo uses spec-driven development via `.ai-dev/` knowledge files.

### `.ai-dev/` Files

- `ARCHITECTURE.md` -- Technology choices, database selection, API conventions, testing strategy, observability patterns. Read this before making architecture decisions.
- `SECURITY.md` -- Data classification, encryption, access controls, secrets management, AI/ML security policies. Read this before handling customer data or adding new storage.
- `LEGAL.md` -- Data residency, retention policies, AI model constraints, third-party service requirements. Read this before changing data flows or adding vendors.
- `PLAN.md` -- Spec template for implementation plans. All plans follow this structure.
- `SYSTEM_PROMPT.md` -- Planning methodology injected by `bin/plan`. Contains research steps, guidelines, and sub-task patterns.

### Creating Implementation Plans

```bash
# Launch spec-driven planning session
bin/plan "description of feature to plan"

# Interactive mode
bin/plan
```

This launches Claude Code with the planning methodology and spec template injected. The planner will:
1. Read `.ai-dev/` files for architecture, security, and legal constraints
2. Research the codebase thoroughly using parallel sub-tasks
3. Write a comprehensive plan following the template in `.ai-dev/PLAN.md`
4. Run the plan-review-agent to validate against standards

### Plan Review Agent

The `plan-review-agent` (in `.claude/agents/`) validates plans against `.ai-dev/` standards. It runs automatically after plan generation and can also be invoked manually:

```
Task(subagent_type="plan-review-agent", prompt="Review the plan at path/to/plan.md")
```
