# GitOps, Security, and Configuration Standards

## Secret Management & Data Masking
- **Audit Trails:** When generating commit histories containing dry-run changes (e.g., `pulumi preview`), explicitly state whether the preview was generated against the `dev` or `gamma` stack. Embed the resource-related logs inside the commit description.
- **Redaction Protocol:** Scan all command outputs, logs, and strings. You MUST permanently redact Project IDs, account numbers, email addresses, tokens, and secret keys, replacing them with `<REDACTED>`.
- **User Alerts:** Print an explicit user-facing warning specifying exactly which properties or variables were redacted to keep git history secure.

## Version Control & Commits
- **Commit Formatting:** Enforce standard Conventional Commits formatting: `<type>(<scope>): <short description>`.
- **State Management:** Ensure Pulumi state files are handled securely. Never commit local secrets to the repository. Ensure configurations are correctly mapped to their respective `Pulumi.dev.yaml`, `Pulumi.gamma.yaml`, or `Pulumi.prod.yaml` files.
