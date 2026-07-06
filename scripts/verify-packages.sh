#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
MOON_LANG="${MOON_LANG_ROOT:-$(dirname "$ROOT")/moon-lang}"
if [[ ! -f "$MOON_LANG/Package.swift" ]]; then
  echo "Set MOON_LANG_ROOT or clone moon-lang as sibling of moon-pkg" >&2
  exit 1
fi

MOON="$MOON_LANG/.build/debug/moon"
if [[ ! -x "$MOON" ]]; then
  (cd "$MOON_LANG" && swift build)
fi

failed=0
for pkg_dir in "$ROOT/packages"/*/; do
  [[ -d "$pkg_dir" ]] || continue
  manifest="$pkg_dir/moon.pkg.json"
  if [[ ! -f "$manifest" ]]; then
    echo "[skip] $(basename "$pkg_dir"): no moon.pkg.json"
    continue
  fi
  name=$(python3 -c "import json; print(json.load(open('$manifest'))['name'])" 2>/dev/null || echo "$(basename "$pkg_dir")")
  echo "[verify] $name"
  while IFS= read -r export; do
    file="$pkg_dir$export"
    if [[ ! -f "$file" ]]; then
      echo "  missing export: $export"
      failed=$((failed + 1))
      continue
    fi
    "$MOON" check "$file" || failed=$((failed + 1))
  done < <(python3 -c "import json; print('\n'.join(json.load(open('$manifest'))['exports']))")
done

if [[ $failed -gt 0 ]]; then exit 1
echo "All packages verified."