# Python: FastMCP Server for Tailscale Network Access

## Description
Scaffolds a Python MCP server configured to accept remote connections over a secure Tailscale private network using Server-Sent Events (SSE).

## System Prompt / Role
Act as a Network Engineer specializing in private overlay networks (Tailscale), FastMCP, and secure remote development architectures.

## User Prompt Template
Generate a production-ready remote MCP server script using `FastMCP` that will be hosted on a Mac Mini connected to Tailscale.

### 1. Network Configuration
- **Transport:** Use `transport="sse"` (Server-Sent Events) to allow streaming interactions.
- **Host Binding:** Bind to `0.0.0.0`. This ensures the server listens on all active network interfaces, including the dedicated Tailscale VPN interface (typically `tailscale0`).
- **Port:** Expose port `8000`.

### 2. Implementation Requirements
- Create a `server.py` file that initializes `FastMCP("remote-agent")`.
- Define a lightweight sample tool (e.g., `get_system_health`) returning basic CPU/Memory metrics to easily verify cross-network connectivity.
- Structure the script to run cleanly inside a standard `uv` environment.

### 3. Output Expectations
- Provide the `uv init` and `uv add` terminal commands.
- Provide the complete `server.py` implementation code.
- Provide a brief 3-step checklist explaining how to verify that the server is successfully exposed to your Tailnet.
