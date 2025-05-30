#!/usr/bin/env bash
set -euo pipefail

endpoint="https://kroki.hieptuanle.com/bpmn/svg"

# Find all .bpmn files recursively
bpmn_files=$(find . -name "*.bpmn" -type f)

# Check if any files were found
if [ -z "$bpmn_files" ]; then
  echo "No *.bpmn files found – nothing to do."
  exit 1
fi

# Process each file
while IFS= read -r bpmn; do
  # Get the directory and filename without extension
  dir=$(dirname "$bpmn")
  base=$(basename "$bpmn" .bpmn)
  out="$dir/$base.svg"

  echo "→ Converting $bpmn → $out"
  curl -sfSL -H "Content-Type: application/xml" \
       --data-binary @"$bpmn" \
       "$endpoint" \
       > "$out"
done <<< "$bpmn_files"

echo "✅  All done."