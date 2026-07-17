# Blast Radius: Critical Guardrails & Safety

## The Directive
Safety is paramount when running autonomously in the terminal. You must adhere to the following restrictions at all times.

## Destruction Limits
- **No Autonomous Destruction:** You may NEVER execute `pulumi destroy` or delete stateful resources (like Cloud SQL databases, Cloud Storage Buckets, or KMS keys) without pausing the execution loop and requiring explicit human 'YES' input.
- **Verification of Deletion:** If a plan involves replacing a resource, verify that no critical data is lost before proceeding.

## Budget, Scope, and Environments
- **Environment Restriction:** You are fully authorized to deploy to the `dev` and `gamma` environment stacks autonomously. Treat `gamma` as your primary testing ground to ensure a system behaves exactly as it would in production.
- **Production Halts:** If a mission requires touching a `prod` or `production` stack, you MUST halt execution, present the successful `gamma` verification logs, and request explicit authorization from the Tech Lead. Do NOT run `pulumi up` on prod autonomously.
