#!/usr/bin/env bash
# The one command that proves a change works. CI runs it as the `verify` check.
# Add the build and tests here as the project gains code.
set -euo pipefail
cd "$(dirname "$0")/.."

jsonschema() {
  if command -v uvx >/dev/null; then
    uvx check-jsonschema==0.39.0 "$@"
  else
    pipx run check-jsonschema==0.39.0 "$@"
  fi
}

jsonschema --schemafile https://coderabbit.ai/integrations/schema.v2.json .coderabbit.yaml
jsonschema --builtin-schema vendor.github-workflows .github/workflows/*.yml
