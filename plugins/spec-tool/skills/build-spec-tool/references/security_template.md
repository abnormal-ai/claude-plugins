# SECURITY.md

## Data Classification

- **Restricted**: Any dataset with customer PII (email, name, user-linked IP) -- strongest protections
- **Confidential**: Customer data without PII -- still requires approved storage
- **Internal/Public**: Non-sensitive operational data
- Classify by most sensitive element: a dataset with even one customer email = Restricted
- Correlatable data: data points that when combined can identify individuals/customers -- classify the combined set, not individual fields
- No Restricted/Confidential data on developer laptops, personal folders, chat tools, or unapproved SaaS tools
- [When unsure about classification, describe your escalation path here]

### Approved Storage for Restricted/Confidential Data

Production systems only:

- [List your approved storage systems: databases, object storage, caches, etc.]

**Not approved**: local laptops, personal devices, unapproved SaaS, chat tools, email attachments

### Temporary Handling Exceptions

[Document any temporary data handling exceptions that require immediate deletion after use]

### Known Incompatibilities (Do Not Worsen)

[Document known non-compliant patterns that should not be expanded:]

- [e.g., Source code containing real customer data -- use anonymized fixtures instead]
- [e.g., Dashboards displaying sensitive identifiers -- use opaque IDs]

## Identity & Access

- Least privilege and need-to-know for all access
- Unique identities only -- no shared accounts
- MFA required for Confidential/Restricted data access
- Production access: [your SSO/VPN requirements]
- Service accounts: non-interactive, documented ownership, regularly reviewed

## API Authentication

- All API endpoints serving data MUST require authentication
- Authentication bypass should ONLY be used for: health checks, metrics, static files, webhook endpoints with their own signature verification
- Never add data-serving endpoints to authentication bypass lists
- "Private network only" is NOT sufficient authentication for API endpoints

## Network Security

- Default-deny stance for all network rules
- Remote access: VPN with MFA, logged and monitored
- [Service mesh requirements if applicable]
- Do not treat "inside VPC/private network" as inherently trusted

## Encryption & Keys

- All cloud storage: encrypted at rest with managed keys
- [Field-level encryption requirements if applicable]
- No custom cryptography -- use established libraries

## Multi-Tenancy

[If applicable, document multi-tenancy requirements:]

- Tenant identifier fields required in all customer data tables
- Tenant isolation patterns
- Routing and deletion logic

## Secrets Management

- [Secrets management solution]
- Secrets must never be checked into source control, logged, or hard-coded in images/env files

## Logging & Access Auditing

- Log security-relevant events: user/service identity, source IP, timestamps, operation, success/failure
- Emit structured logs with tenant/request IDs
- Protect logs from tampering, restrict access, follow retention schedule
- Do NOT log: full message bodies, PII, secrets -- use redaction utilities
- All customer data access must be authorized and auditable

## Token Leakage Prevention

- Never log secrets directly
- Override string representations on classes that handle tokens/credentials
- Audit API clients and credential managers for safe representations

## Secure SDLC

- Peer code reviews (authors cannot review own code)
- Follow change-management with testing and back-out plans
- [Vulnerability SLA timelines]

## AI & ML

- Customer data is not used to train shared/federated models
- GenAI: [your policies on model usage, fine-tuning, data handling]
- Vendor settings: disable prompt/completion logging and training where possible
- Document for each AI feature: which models, what inputs, PII minimization approach
- Engage Security early for data residency, retention, or AI changes

### Model Output Security

- **Input validation**: Validate and sanitize all LLM responses before use
- **Tool restrictions**: LLM tools must not perform unauthorized write actions
