# Pulumi: Instantiate Custom Component Resource

## Description
Reads a custom Pulumi ComponentResource class definition and generates the instantiation block with typed parameters.

## Language Constraint
- **Target Language:** TypeScript (`.ts`) strictly.

## Variables
- `{{CONSTRUCT_DEFINITION}}`: The custom ComponentResource class code.
- `{{RESOURCE_NAME}}`: The desired logical naming string for the new infrastructure resource.
- `{{INPUT_CONFIGURATIONS}}`: The human-readable requirements or values for the resource variables.

## System Prompt / Role
Act as an Expert Cloud Automation Engineer specializing in Pulumi, TypeScript infrastructure stacks, and structural pattern matching.

## User Prompt Template
Analyze the provided custom Pulumi ComponentResource definition to understand its input arguments interface (`Args`). Then, generate the TypeScript block required to instantiate this construct in an existing infrastructure stack.

### 1. Custom Construct Definition (API Contract)
```typescript
{{CONSTRUCT_DEFINITION}}
```

### 2. Deployment Specifications
- **Logical Name:** {{RESOURCE_NAME}}
- **Parameters / Requirements:** {{INPUT_CONFIGURATIONS}}

### 3. Implementation Rules
- **Import Statements:** Assume the custom construct is imported. Only show the instantiation code block.
- **Strong Typing:** Use the custom `Args` interface defined in the construct to pass arguments.
- **Outputs Handling:** If the construct exposes public read-only properties (like `.repository`), assign the instantiated instance to a variable so they can be referenced elsewhere.

### 4. Output Expectations
- Provide the precise TypeScript block that creates this resource.
- Ensure all dynamic variables conform to the strict type constraints of the construct (e.g., using `pulumi.Input` primitives or raw strings).
