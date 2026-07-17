# IAM & Identity Standards: Critical Constraints

## The Directive
You are modifying the security perimeter of a Google Cloud environment. Mismanaging IAM state will cause catastrophic access loss or security breaches. You must strictly adhere to the following behavioral and syntax rules regarding Google Cloud IAM and Service Accounts.

## Service Accounts: Resource vs. Identity
- **As a Resource:** When you need to allow members to run operations *as* a service account or modify the service account itself, you add IAM policy bindings to the service account resource.
- **As an Identity:** When you need to configure permissions for a service account to access *other* GCP resources, do NOT modify the service account's internal policy. Instead, use the `googleProjectIam` set of resources (or the resource-specific IAM member, like `gcp.storage.BucketIAMMember`).

## The Binding Rules (Authoritative vs. Non-Authoritative)
You have three distinct resources to manage IAM policies. You must select the correct one to prevent infinite state-fighting in Pulumi:

1. `gcp.serviceaccount.IAMPolicy` (**Authoritative**): Sets the IAM policy and completely REPLACES any existing policy attached to the resource. Avoid using this unless you are intentionally wiping and locking down all permissions.
2. `gcp.serviceaccount.IAMBinding` (**Authoritative for a given role**): Updates the IAM policy to grant a role to a list of members. It preserves other roles, but overwrites all members of the *specified* role.
3. `gcp.serviceaccount.IAMMember` (**Non-authoritative**): Updates the IAM policy to grant a role to a single new member. All other members and roles are preserved. **This is your default, safest choice for adding permissions.**

## Critical State-Conflict Guardrails
If you violate these rules, the Pulumi state will fight during execution.
- **NEVER** use `IAMPolicy` in conjunction with `IAMBinding` or `IAMMember` on the same resource.
- **NEVER** use `IAMBinding` resources in conjunction with `IAMMember` resources if they grant privilege to the *exact same role*. 
- **Gamma Validation:** Because IAM changes are highly destructive if done incorrectly, you must successfully execute and validate any IAM logic in the `gamma` stack before requesting `prod` approval.

## Code-Level IAM Constraints (Anti-Patterns to Reject)
- **CRITICAL:** When granting Secret Manager access inside a custom ComponentResource, NEVER use `secretmanager.SecretIamBinding`. If multiple components share access to token infrastructures, they will overwrite each other's security policies. You MUST strictly use `secretmanager.SecretIamMember` to ensure non-authoritative multi-tenant isolation.
- **Example Pattern Violation Fix:**
  *Instead of:* `new secretmanager.SecretIamBinding(...)`
  *You must generate:* `new secretmanager.SecretIamMember(...)` for each separate identity resource.
