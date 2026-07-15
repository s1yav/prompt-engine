# Python: Gemini Client via Tailscale MagicDNS

## Description
Creates a client script that uses the Google Gen AI SDK to securely query a remote FastMCP server over a Tailscale private network using MagicDNS.

## Variables
- `{{TAILSCALE_MACHINE_NAME}}`: The MagicDNS name assigned to your Mac Mini in your Tailscale admin console (e.g., `mac-mini`).
- `{{SERVER_PORT}}`: The port your server is exposed on (default: `8000`).

## System Prompt / Role
Act as an AI Systems Integrator specializing in the Google Gen AI SDK (`google-genai`) and remote MCP client routing.

## User Prompt Template
Write a Python client script that hooks up the Gemini 1.5 Flash model to an active remote MCP server running over a Tailscale network.

### 1. Connection Logic
- **URL Configuration:** Construct the target endpoint dynamically using the pattern: `http://{{TAILSCALE_MACHINE_NAME}}:{{SERVER_PORT}}/sse`. 
- **Client Bootstrap:** Use the `mcp` client SDK to connect via Server-Sent Events (SSE) to that exact MagicDNS URL.

### 2. Interaction Flow
- Initialize the Google Gen AI client via `google.genai.Client`.
- Dynamically fetch the tools list available on the remote Tailscale node.
- Convert those MCP tools into Gemini-compatible function schemas.
- Implement the core chat engine loop: pass user prompts to Gemini, intercept requested tool execution payloads, fire them over the Tailscale tunnel to the Mac Mini, and return the data to Gemini.

### 3. Output Expectations
- Provide the `uv add` commands for `google-genai` and `mcp`.
- Provide the complete, production-ready `client.py` script.
