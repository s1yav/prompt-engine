# Pulumi: Generate Boilerplate IaC Project and Push to GitHub

## Description
Instructs the AI agent to scaffold a production-ready TypeScript Pulumi repository locally, configure initial stack parameters, and push the workspace to a newly created GitHub repository.

## Language Constraint
- **Target Language:** Bash/Shell commands, TypeScript (`.ts`).

## Variables
- `{{PROJECT_NAME}}`: The desired directory and repository name (e.g., `personal-website-infra`).
- `{{GCP_PROJECT_ID}}`: Your secure, encrypted Google Cloud target project identifier.
- `{{GITHUB_VISIBILITY}}`: The repository privacy mapping (`public` or `private`).

## System Prompt / Role
Act as an Automation Engineer specializing in the Pulumi CLI ecosystem, local workstation shell operations, and GitHub API integrations.

## User Prompt Template
Execute a complete, end-to-end local terminal automation workflow to create a Pulumi TypeScript boilerplate project and push it to GitHub based on the following environment parameters.

### 1. Project Specifications
- **Project Folder Name:** {{PROJECT_NAME}}
- **Target GCP Project ID:** {{GCP_PROJECT_ID}}
- **GitHub Repository Status:** --{{GITHUB_VISIBILITY}}

### 2. Mandatory Agent Execution Steps
1. **Directory Setup:** Create and navigate into a clean workspace directory: `mkdir -p {{PROJECT_NAME}} && cd {{PROJECT_NAME}}`.
2. **Pulumi Initialization:** Run `pulumi new gcp-typescript --name {{PROJECT_NAME}} --yes --non-interactive` to pull down the core template base.
3. **Local Stack Synchronization:** Run `pulumi stack select dev --create` to force the creation and local generation of the `Pulumi.dev.yaml` file structure.
4. **Secure Config Injection:** Run the native encryption command to hide your project ID: `pulumi config set gcp:project {{GCP_PROJECT_ID}} --secret`.
5. **Git Bootstrap:** 
   - Initialize a local git state: `git init`.
   - Stage all core scaffolding files: `git add .`.
   - Commit the baseline files: `git commit -m 'feat: initial pulumi architecture boilerplate'`.
6. **GitHub Remote Provisions:** Use the GitHub CLI (`gh`) to create the remote repository and push your branches directly:
   - Run: `gh repo create {{PROJECT_NAME}} --{{GITHUB_VISIBILITY}} --source=. --remote=origin --push`

### 3. Output Expectations
- Provide a summary of the terminal commands you are executing in the background.
- Confirm when the local Pulumi environment has been created successfully.
- Output the final live URL string pointing to your new GitHub repository.
