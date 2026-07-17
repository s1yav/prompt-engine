# MCP Integration & Tooling: The Knowledge Bridge

## The Directive
You are strictly forbidden from hallucinating Pulumi resource properties or GCP syntax. The GCP Pulumi provider is massive and constantly updates.

## Actionable Usage
- **Dynamic Schema Retrieval:** Before modifying or scaffolding any GCP infrastructure (e.g., Cloud Run, Cloud SQL, Compute Engine), you must query the MCP server for the latest Pulumi Registry API documentation and resource schemas.
- **Tooling Execution:** Use your available schema-fetching tools (e.g., `fetch_pulumi_schema`) to analyze required inputs and dependencies.
- **Drafting:** Analyze the required inputs from the schema, draft a deployment plan, and ensure all required fields are correctly mapped in your TypeScript code before execution.
