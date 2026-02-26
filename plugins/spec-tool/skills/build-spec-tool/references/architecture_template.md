# ARCHITECTURE.md

## Language and Framework Selection

[Document your technology choices and when to use each. Examples:]

### When to Use [Primary Language]

- [Use case 1]
- [Use case 2]

### When to Use [Secondary Language]

- [Use case 1]
- [Use case 2]

### Concurrency Patterns

- **[Language]**: [Preferred concurrency model]

## Database Selection

[Document your database strategy. Consider:]

- Primary database and when to use it
- Secondary databases for specific use cases
- Decision criteria: availability requirements, query complexity, cost, latency

## Data Model Requirements

[Standard fields and patterns for data models. Consider:]

- Tenant identifier fields (for multi-tenant systems)
- Timestamp fields for retention and deletion support
- Routing and partitioning strategy

## Service Communication

### Synchronous APIs

- [Primary protocol: gRPC, REST, GraphQL]
- Conventions for request/response naming
- Versioning strategy

### Asynchronous Communication

- [Message queue/event system choices]
- Message format standards (protobuf, JSON, Avro)
- Schema evolution rules

### External Service Integration

- Async handler patterns for external services
- Timeout and retry strategies
- Circuit breaker patterns

## API Design

### Protocol Selection

[When to use each protocol:]

- **[Protocol A]**: [Use cases]
- **[Protocol B]**: [Use cases]

### Multi-Tenancy in APIs

[How tenant context is passed in API requests]

### Pagination Pattern

[Standard pagination approach]

## Testing Strategy

### [Language A] Testing

- **Framework**: [e.g., pytest, Jest, Go testing]
- **Location**: [Convention for test file placement]
- **Mocking policy**: [What to mock, what not to mock]

### [Language B] Testing

- **Framework**: [e.g., ginkgo, JUnit]
- **Location**: [Convention for test file placement]

### Test Commands

```bash
# [Language A]
[test command]

# [Language B]
[test command]
```

## Configuration Management

### Secrets Management

- [Secrets storage solution]
- Access patterns
- Never commit secrets to source control

### Feature Flags

- [Feature flag system and when to use it]
- [Service config system and when to use it]

## Observability

### Logging

- [Structured logging framework]
- Context propagation patterns

### Metrics

- [Metrics framework]
- Naming conventions
- Cardinality guidelines

### Tracing

- Trace ID propagation
- Header conventions

### Alerting

- Standard thresholds
- Alert definition patterns

## Caching Strategy

### When to Use Distributed Cache

- [Use cases for distributed caching]

### When to Use In-Memory Caching

- [Use cases for in-memory caching]

### Cache Key Conventions

- [Naming patterns for cache keys]

## Background Processing

### Decision Tree

1. **Scheduled/periodic job?** -> [Solution]
2. **High-volume event processing?** -> [Solution]
3. **Service-level async task?** -> [Solution]
4. **Batch data pipeline?** -> [Solution]

## Authentication and Authorization

### Service-to-Service

- [Auth mechanism: mTLS, API keys, JWT]

### User Authentication

- [Auth provider and protocol]

## CLI Guidelines

### When to Build a CLI

- [Criteria for building CLIs]
- Documentation requirements
