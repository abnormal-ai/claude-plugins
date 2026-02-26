## Overview

[Brief description of what we're implementing and why. Focus on business value and impact. If a source was provided, include it here as: "This plan was created from [source description/link]."]

## Problem Statement

[Describe the pain point being addressed and who is affected. Be specific about the current limitations or issues.]

## Goals

[Goals should be tied to customer outcomes, not engineering outcomes (even if the customers are other engineering teams). It's not sufficient to say "ship service X" -- consider end goals like: roll out to specific customers, enable specific use cases, migrate away from existing service, achieve specific SLAs.]

## Stakeholders

[Note: Include if the provided context indicates the project requires coordination with other teams, has external dependencies, affects customers, or meets standards requiring stakeholder involvement as defined in LEGAL.md, SECURITY.md, or ARCHITECTURE.md. Who needs to be consulted and/or informed for planning/building/rollout? Who is or represents the customer? Which teams represent upstream/downstream dependencies?]

| Stakeholder (Team or Person) | How |
|------------------------------|-----|
| [Team/Person name] | [e.g., produces data into X, we consume from it, consult for customer comms for rollout] |
| [Team/Person name] | [e.g., downstream consumer of our service, needs notification of breaking changes] |
| [Team/Person name] | [e.g., represents customer requirements, approves UX changes] |

## What We're NOT Doing

[Explicitly list out-of-scope items to prevent scope creep]

## Architecture Overview

### Desired State Architecture

```mermaid
[Create a mermaid diagram showing the desired end state architecture/data flow/system state.
Choose the appropriate diagram type from graph TB/LR, flowchart, sequenceDiagram.
This should show the target architecture after implementation is complete.]
```

**Key Changes:**
- [Brief description of architectural change 1]
- [Brief description of architectural change 2]
- [...]

## Key Design Decisions

1. **[Decision 1 title]**: [Brief rationale -- why this approach over alternatives]
2. **[Decision 2 title]**: [Brief rationale]
3. **[...]**

## Open Questions

[List any technical uncertainties, design decisions needed, or clarifications required. If regenerating this plan, address these questions in the detailed_concept_description.]

- [ ] [Technical uncertainty that needs resolution]
- [ ] [Design decision that affects implementation approach]
- [ ] [Clarification needed about business logic or requirements]

## Infrastructure

[Note: Include if project requires specific infrastructure configuration beyond defaults. Focus on initial setup and technical configuration decisions.]

[Consider these aspects as applicable:]

- Message queues: Partition count, partition key selection, consumer group strategy
- Caching: Single vs clustered mode, shard count, replica configuration
- Databases: Read replicas, proxies, connection pooling strategy
- Search indexes: Index mapping, indexing strategy, lifecycle management
- Configuration management: Feature flags, service config, environment-specific settings
- Initial Sizing: Instance types, initial data volume estimates, baseline infrastructure costs
- Architecture Deviation (if non-standard): Does this deviate from standard architecture? Client-side components? Critical path implications?

## Data Schemas

[Note: Only include this section if the project involves new data structures, APIs, or storage mechanisms.]

[Define key data structures and schemas. Consider these aspects as applicable:]

- Storage (if persisting data): Database tables, columns, indexes, constraints
- APIs (if exposing endpoints): Request/response formats, protobuf/GraphQL/OpenAPI schemas
- Caching (if using cache): Key patterns, value types, TTLs
- Messaging (if using queues/events): Message schemas, partition keys, event formats
- In-Memory (if complex data structures): Data classes, enums, type definitions
- External Integrations (if calling third-party services): API contracts, webhook payloads
- Schema Evolution: How will schema updates be handled? Migration strategy, backward compatibility

[For each relevant aspect, document the structure, purpose, and key design decisions]

## Multi-environment Considerations

[Note: Only include this section if the project has environment-specific requirements or needs to run across multiple environments/regions.]

[Consider these aspects as applicable:]

- Regions: Which regions/environments will this run in? Note any regional differences.
- Environment Differences (if behavior varies): Configuration variations for dev/staging/prod
- Data Replication (if cross-region data): Data flow or replication needs across regions
- Feature Flags (if conditional rollout): Environment-specific feature toggles
- Secrets Management (if credentials differ): Environment-specific credentials or configuration

## Observability

[Note: Only include this section if the project requires new metrics, dashboards, or monitoring beyond standard service observability.]

[Consider these aspects as applicable:]

- Metrics (if measuring performance/usage): Performance (latency, throughput, errors), business (usage, adoption), resource (CPU, memory, costs)
- Dashboards (if visualizing data): Health monitoring views, debugging panels, business intelligence
- Alerts (if proactive monitoring): Critical thresholds, warning conditions, escalation policies
- Logging (if tracing behavior): Key trace points, error handling, structured logging fields
- Tracing (if distributed system): Distributed tracing spans, correlation IDs, service dependencies
- Debugging (if complex troubleshooting): Tools, endpoints, or runbooks for troubleshooting

## Privacy and Security

[Note: Always include this section. If no material changes to security posture, state that explicitly.]

[Consider these aspects as applicable:]

- Data Privacy: Customer/private data accessed, how data is used, encryption strategy, retention period, deletion mechanisms
- Multi-tenancy (if storing customer data): Tenant identifier fields, time-based indexing, multi-tenant isolation
- Access Controls: Service access restrictions (SSO, OAuth, IAM), data access controls, key management
- Security Protections (if exposed endpoints): DDoS/brute-force protection, input validation, rate limiting
- Threat Modeling: How could the system be exploited? Does it rely on security through obscurity?
- Penetration Testing (if handling sensitive data): Testing requirements and scope

### Privacy & Security Checklist

[Note: Use this checklist to ensure comprehensive coverage. For each applicable item, provide a brief response with a pointer/citation to the relevant section of the plan.]

**Private Data Identification:**
- If the service accesses/creates/collects private data: What private data is involved? [response + cite section]
- If data is processed: How is it being used? (stored, aggregated, combined with other data) [response + cite section]

**Data Access:**
- If external parties access data: Who has/needs access? [response + cite section]
- If employees access data: Who has access? [response + cite section]
- If internal systems access data: Which components access it? [response + cite section]
- If third-party integrations exist: Do 3rd-party services access it? [response + cite section]

**Data Storage:**
- If data is persisted: Will it be stored anywhere (even transiently)? [response + cite section]
- If messaging is involved: Will it flow through messaging systems? [response + cite section]

**Privacy Protections:**
- If private data is handled: What measures are taken to keep it private? [response + cite section]
- If customer data is stored: How does data deletion work? [response + cite section]

**Access Controls:**
- If the service collects data: What access controls restrict access? [response + cite section]
- If sensitive data is stored: Is data encrypted? [response + cite section]
- If encryption is used: How is access to keys restricted? [response + cite section]

**Service Access Controls:**
- If the service has access restrictions: What controls restrict access to the service itself? [response + cite section]
- If authentication is required: What authentication mechanisms are in place? [response + cite section]

**Attack Protection:**
- If the service is exposed: How does the service prevent DDoS attacks? [response + cite section]
- If authentication exists: How does the service prevent brute-force attacks? [response + cite section]

**Threat Modeling:**
- If security is critical: If someone had perfect knowledge of how this service worked, how could they exploit it? [response + cite section]
- If access controls exist: How can access controls be bypassed? [response + cite section]
- If sensitive data is handled: How could data be leaked? [response + cite section]

## Performance Considerations

[Note: Only include if the project has specific performance requirements or scalability concerns.]

[Consider these aspects as applicable:]

- Latency (if response time matters): Target latencies, bottlenecks, optimization strategies
- Throughput (if handling high volume): Expected load, rate limits, scaling strategy
- Resource Usage (if constrained resources): Memory footprint, CPU usage, connection pool sizing
- Database Performance (if data-intensive): Query optimization, indexing strategy, connection pooling
- Caching Strategy (if reducing load): What to cache, invalidation logic, cache warming
- Batch Processing (if bulk operations): Batch sizes, parallelization, memory management
- Scalability: How does it scale with user/data/traffic volume growth?
- Edge Cases (if high variability): Bursty traffic handling, noisy neighbor scenarios

## Testing Strategy

[Note: Provide high-level testing strategy. Do NOT include specific test code or full test implementations.]

[Consider these aspects as applicable:]

- Unit Tests: What to test, key edge cases, coverage expectations
- Integration Tests (if cross-component interactions): End-to-end scenarios, service dependencies
- Load/Performance Tests (if performance-critical): Expected load patterns, stress testing scenarios
- Security Tests (if handling sensitive data): Authentication, authorization, input validation
- Manual Testing: Specific steps to verify feature behavior, edge cases, user workflows
- Regression Tests (if modifying existing behavior): Scenarios to verify no breaking changes

## Cost and Capacity Planning

[Note: Include if project has cost implications or requires capacity planning. Do not speculate -- only include aspects you can support with concrete information.]

- Initial Costs: Infrastructure setup costs, migration costs, one-time development expenses
- Recurring Costs: Monthly infrastructure costs, storage costs, third-party API costs
- Cost Drivers: Key factors that increase costs
- Capacity Limits: Hard limits (API rate limits, connection pools, storage quotas), soft limits
- Growth Projections: Expected growth over 6-12 months
- Cost Optimization: Strategies to reduce costs

## Customer Impact

[Note: Include if project affects customer experience or requires rollout coordination. Do not speculate -- only include aspects you can support with concrete information.]

- Customer-Facing Changes: What customers will see/experience
- Rollout Strategy: Phased rollout plan, feature flags, beta customers, canary deployment
- Customer Communication: Release notes, documentation updates, notifications
- Backward Compatibility: Will existing workflows/integrations continue to work?
- Customer Risk Mitigation: What could go wrong from customer perspective?
- Rollback Strategy: How to roll back if customers report critical issues?

## Implementation Phases

| Phase | Description | Dependencies |
|-------|-------------|--------------|
| Phase 1: [Name] | [What this phase accomplishes] | [Prerequisites or blockers] |
| Phase 2: [Name] | [What this phase accomplishes] | Phase 1, [other deps] |
| Phase N: [Name] | [What this phase accomplishes] | [Dependencies] |

# Implementation Guide

This appendix contains detailed implementation information for executing this plan.

## Current State Analysis

[Detailed analysis of what exists now, what's missing, and key constraints discovered during research]

### Current Architecture Diagram

```mermaid
[Create a mermaid diagram showing the current architecture/data flow/system state.
Choose the appropriate diagram type from graph TB/LR, flowchart, sequenceDiagram]
```

### Key Discoveries

- [Important finding with file:line reference]
- [Pattern to follow]
- [Constraint to work within]

## References

- Similar implementation: `[file:line]`

## Phase 1: [Descriptive Name]

### Overview

[What this phase accomplishes]

### Changes Required

[Note: Some phases may involve only migration commands, while most will have code changes.]
[Note: Git commands, the detailed contents of test files or documentation files should not be included.]

#### 1. [Component/File Group]

**File**: `path/to/file.ext`
**Changes**: [Summary of changes]

```[language]
// Focus on signatures, types, interfaces, and key external calls
// Use numbered comments to show logic flow, avoid full implementations
// Mention important API calls/dependencies explicitly
//
// Example:
// def process_data(input: DataInput) -> DataOutput:
//   # 1. Validate input against schema
//   # 2. Call external API: fetch_data_from_service(input.id)
//   # 3. Apply business transformation rules
//   # 4. Store to database
//   # ... implementation ...
//   return output
```

#### 2. [Migration/Infrastructure Commands]

**Commands**: [If phase includes migration, secrets, or configuration commands.]

```bash
# Use your project's actual CLI tools here
```

### Verification

#### Automated Checks

[Choose commands appropriate to the language and project. Common patterns:]
- [ ] Tests pass: `pytest tests/` or `go test -v ./...` or `npm test`
- [ ] Type checking passes: `mypy src/` or `tsc --noEmit`
- [ ] Linting passes: `ruff check` or `eslint .` or `golangci-lint run`
- [ ] Build succeeds: `make build` or `go build ./...` or `npm run build`

#### Manual Checks

- [ ] Feature works as expected when tested via UI/API
- [ ] Performance is acceptable under expected load
- [ ] Edge case handling verified manually
- [ ] No regressions in related features
- [ ] Logs and metrics show expected behavior

**Note**: Ensure all automated checks pass before manual testing. Manual verification should be completed before proceeding to the next phase.

## Phase 2: [Descriptive Name]

[Similar structure with both automated and manual verification...]
