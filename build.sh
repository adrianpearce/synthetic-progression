#!/usr/bin/env bash
set -euo pipefail

# Optional argument: file prefix (default to empty)
PREFIX="${1:-}"

# Always run from repo root (important if script is called elsewhere)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# echo "==> Rendering manuscript"
quarto render --profile manuscript

# echo "==> Rendering slides"
# quarto render --profile slides

# echo "==> Running DeckTape batch"
# ./batch-decktape-parallel.sh "$PREFIX" || true

echo "==> Publishing manuscript"
quarto publish --profile manuscript gh-pages --no-prompt 

xdg-open "https://adrianpearce.github.io/synthetic-progression/"

