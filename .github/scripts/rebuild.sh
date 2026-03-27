#!/usr/bin/env bash
set -euo pipefail

# Rebuild script for PaloAltoNetworks/docusaurus-template-openapi-docs
# Runs on existing source tree (no clone). Installs deps, runs pre-build steps, builds.

# --- Node version ---
# Docusaurus 3.9.2 requires Node >=18; using Node 20
export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
    # shellcheck source=/dev/null
    . "$NVM_DIR/nvm.sh"
    nvm use 20 || nvm install 20
fi

# --- Package manager + dependencies ---
# No lock file committed; using npm
npm install

# --- Build ---
npm run build

echo "[DONE] Build complete."
