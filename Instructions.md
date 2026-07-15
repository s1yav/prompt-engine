# Prompt Execution Instructions

This file contains copy-paste macro execution templates for every prompt in this repository.

## Cloud Engineering

Execute the template prompt @pulumi-consume-component-resource.md
- **CONSTRUCT_DEFINITION**: [Highlight your ArtifactRegistry code block in your editor, or reference the file using @ArtifactRegistry.ts]
- **RESOURCE_NAME**: "frontend-docker-images"
- **INPUT_CONFIGURATIONS**: "Deploy in us-east1. The format must be DOCKER, set the description to 'Main repository for app container images', and make tags immutable."

Execute the template prompt @pulumi-refactor-component-resource.md
- **SOURCE_CODE**: [Highlight the target resource block or reference the file containing the raw code to refactor]

## MCP Suite

Execute the template prompt @python-mcp-client-gemini-tailscale.md
- **TAILSCALE_MACHINE_NAME**: "mac-mini"
- **SERVER_PORT**: "8000"

Execute the template prompt @python-mcp-resource.md
- **RESOURCE_URI**: "logs://system/{app_name}"
- **RESOURCE_NAME**: "System Application Log Viewer"

Execute the template prompt @python-mcp-remote-server.md

Execute the template prompt @python-mcp-tool.md
- **TOOL_NAME**: "query_sales_data"
- **TOOL_DESCRIPTION**: "Queries sales data for a specific region and date range."
- **INPUT_PARAMETERS**: "region (str, e.g. 'us-west'), start_date (str, e.g. '2026-01-01'), end_date (str, e.g. '2026-01-31')"
