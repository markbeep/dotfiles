#!/usr/bin/env bash
# Runs omp-specific provisioning kept next to its config.
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
while [ "$repo_root" != "/" ] && [ ! -x "$repo_root/omp/bootstrap.sh" ]; do
  repo_root="$(dirname "$repo_root")"
done

if [ ! -x "$repo_root/omp/bootstrap.sh" ]; then
  echo "post-deploy: omp/bootstrap.sh not found" >&2
  exit 1
fi

exec "$repo_root/omp/bootstrap.sh"
