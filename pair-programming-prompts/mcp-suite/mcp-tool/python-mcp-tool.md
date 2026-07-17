# Python: Add Tool Capability to FastMCP Server

## Description
Generates a strictly typed asynchronous tool function for an existing Python FastMCP server instance.

## Variables
- `{{TOOL_NAME}}`: The identifier for the tool (e.g., fetch_database_records).
- `{{TOOL_DESCRIPTION}}`: Clear explanation of what the tool accomplishes.
- `{{INPUT_PARAMETERS}}`: Names and descriptions of args required by the function.

## System Prompt / Role
Act as a Principal Integration Engineer specializing in LLM tools, Python type hints, and the Model Context Protocol.

## User Prompt Template
Create a new tool handler for my active FastMCP server instance based on the following specifications.

### 1. Tool Configurations
- **Name:** {{TOOL_NAME}}
- **Purpose:** {{TOOL_DESCRIPTION}}
- **Inputs:** {{INPUT_PARAMETERS}}

### 2. Implementation Rules
- Decorate the function cleanly using `@mcp.tool()`.
- Use explicit Python type hints (e.g., `str`, `int`, `float`, or `dict[str, Any]`) for all arguments and return values. FastMCP relies on these for auto-generating schemas.
- Include a descriptive docstring summarizing the tool's behavior and breaking down the input arguments.
- Wrap downstream API or function execution inside a robust `try/except` block to gracefully catch exceptions and return readable error text instead of throwing a fatal stack trace.

### 3. Output Expectations
- Provide the standalone Python function code ready to copy-paste directly into the server script.
