# System Lifecycles & Naming Conventions: The "Right to be Forgotten"

## The Core Philosophy: Right to be Forgotten (RTBF)
You must design every infrastructure component using the "Right to be Forgotten" principle. In system architecture, RTBF means that any entity—whether a user, a feature, a microservice, or a tenant—can be easily identified, surgically extracted, and permanently deleted without leaving orphaned infrastructure, causing dependency failures, or cluttering the state. Elegance is defined by how cleanly a system can be dismantled.

## Strict Naming Conventions
To enforce RTBF, resource names must instantly identify their ownership, purpose, and environment. Never use generic names like `web-server` or `data-bucket`. 
- **Format:** `<namespace>-<domain>-<resource_type>-<env>`
- **Namespace:** The core owner or platform identifier (e.g., `s1yav`).
- **Domain:** The specific project or microservice (e.g., `git`, `portfolio`, `firebasehost`).
- **Resource Type:** The GCP resource identifier (e.g., `bucket`, `sql`, `cloudrun`, `sa`).
- **Environment:** The stack layer (`dev`, `gamma`, `prod`).
- *Example:* `s1yav-git-cloudbuild-dev`

## Mandatory GCP Labeling
You must apply GCP labels to EVERY resource that supports them. Labels are the functional mechanism that allows us to query and audit specific data footprints for deletion.
- `owner`: The namespace owner (e.g., `s1yav`).
- `domain`: The project it belongs to.
- `contains-tenant-data`: `true` or `false` (Critical for RTBF; dictates if a strict data wipe is required upon off-boarding).
- `managed-by`: `pulumi`

## Architectural Modularity (Pulumi ComponentResources)
- **Encapsulation:** Never deploy scattered, flat resources. Group related infrastructure into a strongly typed Pulumi `ComponentResource`. For example, a `GitOpsPipeline` component should encapsulate the Cloud Build trigger, its Service Account, and its IAM bindings.
- **State Deletion:** By encapsulating resources into a component, you ensure that if a domain needs to be "forgotten," deleting the parent `ComponentResource` from the codebase will perfectly cascade the deletion to all associated child resources in GCP, leaving zero orphaned state.

## Data Ephemerality and Storage
- **Logical Segregation:** When provisioning Cloud Storage or databases, apply logical segregation (e.g., tenant-specific database schemas or bucket prefixes) so a specific user's data can be wiped without dropping the entire cluster.
- **Orphan Prevention:** Ensure that deleting a compute resource gracefully cleans up any attached disks, network interfaces, or ephemeral state it created.

## Identity Segregation for RTBF Compliance
- **Zero Shared Default Accounts:** When creating automated triggers (like `gcp.cloudbuild.Trigger`), you are strictly FORBIDDEN from letting the resource default to the broad Google-managed default runtime service accounts (`@cloudbuild.gserviceaccount.com`).
- **Isolation Mandate:** For every distinct workload, component, or repository pipeline you instantiate, you MUST explicitly provision a dedicated, tightly-scoped User-Managed Service Account (`gcp.serviceaccount.Account`) following your exact `<namespace>-<domain>-sa-<env>` naming standard. This guarantees that when a domain is deleted, its security identity can be cleanly dropped without impacting any adjacent sister services.
