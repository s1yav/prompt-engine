#!/usr/bin/env bash
set -euo pipefail

echo "🔍 Validating prompt formats..."
errors=0

# Check file names and required content strings
while IFS= read -r -d '' file; do
    filename=$(basename "$file")
    
    # 1. Enforce naming convention: 3 parts separated by hyphens
    if [[ ! "$filename" =~ ^[a-z0-9]+-[a-z0-9]+-[a-z0-9.-]+\.md$ ]]; then
        echo "❌ Invalid filename: $file (Must match [tech]-[action]-[intent].md)"
        ((errors++))
    fi

    # 2. Check for System Prompt header
    if ! grep -q "## System Prompt / Role" "$file"; then
        echo "❌ Missing system prompt header in: $file ('## System Prompt / Role')"
        ((errors++))
    fi

    # 3. Check for Output Expectations header
    if ! grep -q "## Output Expectations" "$file"; then
        echo "❌ Missing output expectations header in: $file ('## Output Expectations')"
        ((errors++))
    fi

done < <(find prompts -type f -name "*.md" -print0)

if [ "$errors" -gt 0 ]; then
    echo "⚠️ Validation failed with $errors error(s)."
    exit 1
else
    echo "✅ All prompts validated successfully!"
    exit 0
fi
