#!/bin/sh
# Wraps the game page (written for claude.ai artifacts, which add the document skeleton)
# into a standalone index.html for GitHub Pages.
set -e
here="$(cd "$(dirname "$0")" && pwd)"
src="$here/../hyakugoju.html"
out="$here/index.html"
{
  printf '%s\n' '<!doctype html>' '<html lang="ja">' '<head>' \
    '<meta charset="utf-8">' \
    '<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">' \
    '<style>:root{padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}</style>' \
    '</head>' '<body>'
  cat "$src"
  printf '%s\n' '</body>' '</html>'
} > "$out"
echo "built $out"
