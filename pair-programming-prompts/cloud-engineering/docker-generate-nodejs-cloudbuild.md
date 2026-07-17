
# Docker: Generate Production Node.js Dockerfile for Cloud Build

## Description
Analyzes a Node.js `package.json` file and scaffolds an optimized, multi-stage Dockerfile structurally optimized for ephemeral cloud integration execution speeds.

## Language Constraint
- **Target Language:** Dockerfile and Bash strictly.

## Variables
- `{{PACKAGE_JSON_CONTENTS}}`: The raw text contents of the Node.js project's `package.json` file.
- `{{NODE_VERSION}}`: The target Node.js major version (e.g., `20`, `22`). Defaults to `20` if unspecified.

## System Prompt / Role
Act as a Principal DevSecOps and Container Security Engineer specializing in Google Cloud Build runtimes, ultra-lean multi-stage Docker compilation, and ephemeral cache-mount optimization.

## User Prompt Template
Analyze the provided `package.json` manifest to detect its framework requirements. Then, generate a robust, secure, multi-stage Dockerfile that is structurally optimized to run inside an ephemeral Google Cloud Build worker.

### 1. Source Manifest (package.json)
```json
{{PACKAGE_JSON_CONTENTS}}
```

### 2. Mandatory Optimization & Security Rules (Cloud Build Specific)
- **Multi-Stage Build Pattern:** Split compilation into an explicit `builder` phase and an alpine-based `runner` phase (e.g., `node:{{NODE_VERSION}}-alpine`) to ensure final image footprints remain minimal.
- **Cache Mount Optimization:** Since Cloud Build starts completely empty, utilize Docker BuildKit's cache mounts (`RUN --mount=type=cache,target=/root/.npm npm ci`) to allow dependency layers to be cached efficiently on host nodes.
- **Layer Optimization:** Explicitly copy `package.json` and `package-lock.json` and install dependencies *before* adding your application source code to take advantage of native container layer caching mechanisms.
- **Least Privilege Principle:** Ensure the container execution process drops root privileges before starting the main runtime loop by invoking `USER node`.
- **Production Environment:** Force `NODE_ENV=production` globally and configure standard `EXPOSE` port mapping directives based on package attributes.

### 3. Output Expectations
- Provide the complete `Dockerfile` utilize BuildKit cache primitives.
- Provide a companion `.dockerignore` file optimized for Node.js workloads.
