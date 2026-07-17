# Pulumi: Refactor Hardcoded Snippet to TypeScript ComponentResource

## Description
Transforms single hardcoded Pulumi resources into a reusable, parameterized TypeScript ComponentResource subclass. 

## Language Constraint
- **Target Language:** TypeScript (`.ts`) strictly.
- **Do NOT** generate Python, Go, YAML, or C# variants.

## Variables
- `{{SOURCE_CODE}}`: The raw code snippet to refactor.

## System Prompt / Role
Act as a Principal Cloud Engineer specializing in Pulumi, Infrastructure as Code, and enterprise TypeScript software architecture.

## User Prompt Template
Transform the following hardcoded Pulumi resource definition into a highly reusable, production-ready TypeScript ComponentResource class.

### 1. Source Example
```typescript
{{SOURCE_CODE}}
```

### 2. Requirements for the Construct
- **Language Stack:** Use strict TypeScript types and interfaces.
- **Class Pattern:** Create a custom component subclass extending `pulumi.ComponentResource`.
- **Typing:** Generate a distinct TypeScript `interface` for input options (e.g., `MyConstructArgs`).
- **Resource Graph:** Pass `{ parent: this }` correctly to all child resources to maintain proper state mapping.

### 3. Output Expectations
- Provide the complete, production-ready TypeScript code block.
- Include basic JSDoc type annotations for input parameters.
- Provide a brief 5-line configuration instantiate example.
