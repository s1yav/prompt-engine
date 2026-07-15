# Infrastructure Prompt Ops (`prompt-ops`)

A centralized, version-controlled repository for enterprise AI prompts, system roles, and infrastructure-as-code (IaC) generation templates. This package streamlines pair-programming workflows with advanced AI agents like **Antigravity** and **Cursor**.

---

## 📦 Package Description & Architecture

This repository operates as a local "Prompt Engine." Instead of relying on memory or disparate copy-paste files, it standardizes prompt payloads into structured Markdown components. This ensures consistent, high-density outputs across all engineering team members.

### Folder Tree Blueprint
Prompts are organized using a **three-tier kebab-case** pattern: `[technology]-[action]-[intent].md`.

```text
📁 prompt-engineering/
├── 📄 README.md                 # Package documentation and agent setup
├── 📁 prompts/
│   ├── 📁 cloud-engineering/    # Cloud and IaC automation blueprints
│   │   └── 📄 pulumi-refactor-component-resource.md
│   └── 📁 application-dev/     # Application runtime code structures
└── 📁 scripts/                  # CI/CD and linting utilities
```

---

## 🛠️ Usage: Integrating with Antigravity

Antigravity is an agent-first workspace environment. To ensure its agents proactively locate, index, and apply these templates during your pair-programming sessions, implement one of the execution patterns below.

### Method 1: Workspace Automation (`.antigravityrules`)
Antigravity automatically reads system rules placed at your active code project's root directory. 

1. Create a file named `.antigravityrules` at the root of your application/infrastructure codebase.
2. Paste the configuration block below to bind this `prompt-ops` package to the agent:

```markdown
# Antigravity Workspace Instruction
You are pair-programming with me on infrastructure design.

## Prompt Retrieval Rules
- Before refactoring or writing infrastructure code, you must index the templates located in the local directory: `./prompt-ops/prompts/cloud-engineering/`
- When I ask you to "use the custom construct template," locate the file `pulumi-refactor-component-resource.md` inside that directory, read its system prompt, and execute its requirements exactly.
```

### Method 2: Live Prompt Context Injection (Terminal Interface)
Antigravity supports multi-line context staging directly inside its terminal chat panel.

1. In an empty Antigravity prompt window, press `Ctrl + G`.
2. This opens a temporary system buffer file in your default terminal editor.
3. Reference the template path directly alongside your instruction, save, and exit:
   ```text
   Refactor my active file using the blueprint found at:
   ./prompt-ops/prompts/cloud-engineering/pulumi-refactor-component-resource.md
   ```
4. The file data will automatically stream into the live agent context window.

### Method 3: Cross-IDE Compatibility (Cursor & Copilot)
If you alternate between Antigravity and VS Code/Cursor ecosystems, you can mirror these file configurations natively:

* **For Cursor:** Copy or symlink your rules directly into a root-level `.cursorrules` file.
* **For GitHub Copilot:** Place or link the markdown file into a `.github/prompts/` directory. You can then reference it inside the chat UI using the inline selector: `#prompt:pulumi-refactor`.

---

## 📝 Contribution Rule

All newly contributed prompt assets must follow the strict formatting standard:
1. File naming must match `[tech]-[action]-[intent].md`.
2. Dynamic code blocks must use double curly braces (`{{VARIABLE_NAME}}`) to denote placeholders.
3. Every prompt must explicitly define a **System Prompt / Role** block and an **Output Expectations** block.

