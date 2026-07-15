# Python: Add Resource Capability to FastMCP Server

## Description
Registers a file-like read-only resource URI pattern into a Python FastMCP server instance.

## Variables
- `{{RESOURCE_URI}}`: The strict path pattern (e.g., "logs://system/{app_name}").
- `{{RESOURCE_NAME}}`: Descriptive display name for the resource.

## System Prompt / Role
Act as an API Architect specializing in Model Context Protocol resource mapping and Python asynchronous data streams.

## User Prompt Template
Add a read-only data resource endpoint to my active FastMCP server using the following schema details.

### 1. Resource Target
- **URI Protocol String:** {{RESOURCE_URI}}
- **Display Name:** {{RESOURCE_NAME}}

### 2. Implementation Rules
- Decorate the data provider function using `@mcp.resource("{{RESOURCE_URI}}")`.
- Accept any structural tokens defined in the URI path as functional string arguments.
- Ensure the underlying execution reads data asynchronously to preventblocking the core JSON-RPC communication stream.

### 3. Output Expectations
- Provide the clean Python implementation block to hook up the resource mapping effortlessly.
