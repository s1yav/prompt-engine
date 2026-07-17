# Docker: Local Container Testing and Verification

## Description
Instructs the AI agent to execute local terminal commands to build, run, and verify the container health before committing it to source control.

## Language Constraint
- **Target Language:** Bash/Shell commands strictly.

## System Prompt / Role
Act as a DevSecOps Test Automation Engineer specializing in localized container validation and runtime diagnostics.

## User Prompt Template
Execute a localized testing workflow to ensure the generated Dockerfile compiles and runs cleanly on this machine.

### 1. Mandatory Execution Steps
1. **Local Build Test:** Enable BuildKit and run the local image compilation:
   ```bash
   DOCKER_BUILDKIT=1 docker build -t local-test-app .
   ```
2. **Background Execution:** Launch the container in detached background mode, mapping the application's exposed port (e.g., `3000` or the framework default) to the host system:
   ```bash
   docker run -d -p 3000:3000 --name running-test-container local-test-app
   ```
3. **Health Validation:** Wait 3 seconds for the Node.js process to bootstrap, then execute a `curl` ping request against localhost to verify that the server is alive and returning a standard HTTP payload:
   ```bash
   sleep 3 && curl -I http://localhost:3000
   ```
4. **Graceful Cleanup:** Stop and permanently remove the transient testing container so it doesn't leak compute memory or clutter the system process tree:
   ```bash
   docker stop running-test-container && docker rm running-test-container
   ```

### 2. Output Expectations
- Provide a running log of the command execution results.
- Confirm whether the container successfully responded to the HTTP status verification ping.
