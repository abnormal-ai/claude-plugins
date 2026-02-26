# LEGAL.md

## Data Classification

- **Customer Data**: Any information collected, processed, stored, or transmitted on behalf of a customer through your products/services -- includes personal data (names, emails, IPs), business data, and service-generated data -- always Restricted
- **Derived Artifacts**: Embeddings, behavioral features, summaries -- treat as in-scope for data processing agreements unless Legal explicitly carves them out
- [Add your own data categories here]

## Data Minimization

- Document why each data field is necessary -- no "collect for future AI use" or "just in case"
- Prefer IDs and structured attributes over full raw content
- Prefer derived features over PII where possible
- For healthcare/education/financial: minimize exposure to PHI/FERPA/regulated data
- Regularly clean up outdated or unnecessary data -- do not retain beyond documented purpose

## Storage & Retention

- Store customer data only in approved storage systems
- All customer data tables must include:
  - Tenant identifier fields
  - Timestamps for retention and deletion support (`created_at`, `deleted_at`)
- Default retention periods:
  - [Define your retention tiers here]
- Deletion: Use established deletion pipelines with soft-delete flags, not ad-hoc scripts

## Data Residency

- Customers choose a data residency region -- respect it
- [Document your deployment topology and residency rules:]
  - Where customer data is processed and stored
  - Rules for cross-region data flows
  - Compliance frameworks (GDPR, FedRAMP, etc.)
- Cross-region data flows require explicit justification with legal basis

## AI & Model Constraints

- Never use customer data to train shared or third-party models
- Customer data -> customer-specific models only
- Cross-customer models use only de-identified data
- GenAI/LLM features:
  - Send minimal necessary data (identifiers, short snippets, structured attributes)
  - Disable vendor-side training and stored completions
  - Keep prompt/completion logs in your own infrastructure only

## Third-Party Services

- Any third-party touching customer data = contractual event, not just technical dependency
- Verify:
  - Deployed in regions compatible with customer residency
  - Contractual terms align with "no training on customer data" posture
  - Listed as subprocessor where required

## When to Escalate

Always involve Legal + Privacy + Security when:

- Introducing new data categories, storage systems, or third-party processors
- Changing data residency (new regions, cross-border flows)
- Changing retention beyond established baselines
- Training/evaluating models on customer data outside approved patterns
- Using new AI vendors, models, or regions
- Entering high-risk or sanctions-sensitive markets
- Any sector-specific work (healthcare/PHI, education/FERPA, financial services)

If unsure whether data is PII, escalate to Legal -- don't self-judge.
