# Meta: Generate and Update Execution Instructions

## Description
Analyzes the prompt repository directory and builds or updates an idempotent `instructions.md` file containing precise execution copy-paste examples for every template.

## Language Constraint
- **Target Language:** Markdown (`.md`) strictly.

## System Prompt / Role
Act as an Idempotent Documentation Automation Engineer specializing in repository static analysis, markdown AST parsing, and context mapping.

## User Prompt Template
Analyze the current repository files and generate or incrementally update the file `prompt-engine/instructions.md`.

### 1. Core Workflow & Idempotency Rules
- **Read Existing State First:** Read the current contents of `prompt-engine/instructions.md` if it exists. 
- **Delta Detection:** Scan all `.md` files inside the `prompts/` subdirectories. Identify any new prompt files or files that have been modified since the last documentation generation.
- **Preserve Unchanged Content:** Do not modify, reorder, or rewrite the instruction blocks for prompts that have not changed. Only insert new prompts or overwrite sections for modified prompts.

### 2. Required Block Format
For every prompt file detected, the block inside `instructions.md` must match this exact visual syntax structure:

Execute the template prompt @[FILENAME].md
- **[VARIABLE_1_NAME]**: [Clear, contextual placeholder description or target inline file reference example like @filename.ts]
- **[VARIABLE_2_NAME]**: "[An explicit string or configuration input example matching the prompt's intent]"

### 3. Example Reference Contract
As a baseline reference for formatting, if you parse a prompt called `pulumi-consume-component-resource.md`, its section must look exactly like this:

Execute the template prompt @pulumi-consume-component-resource.md
- **CONSTRUCT_DEFINITION**: [Highlight your ArtifactRegistry code block in your editor, or reference the file using @ArtifactRegistry.ts]
- **RESOURCE_NAME**: "frontend-docker-images"
- **INPUT_CONFIGURATIONS**: "Deploy in us-east1. The format must be DOCKER, set the description to 'Main repository for app container images', and make tags immutable."

### 4. Output Expectations
- Output the completely updated, consolidated text buffer for `prompt-engine/instructions.md`.
