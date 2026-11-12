#!/usr/bin/env bash
# Provision omp plugins and upstream skills. Safe to re-run.
# Skill bodies are not vendored; each source is installed from upstream.
set -euo pipefail

command -v omp >/dev/null 2>&1 || exit 0

plugins="$(omp plugin list --json 2>/dev/null || true)"

install_plugin() {
  local spec="$1" id="$2"
  grep -Fq "$id" <<<"$plugins" || omp plugin install "$spec"
}

install_npx_plugin() {
  local marker="$1"
  shift
  [ -d "$HOME/$marker" ] || npx -y "$@"
}

install_marketplace_plugin() {
  local source="$1" id="$2"
  omp plugin marketplace list 2>/dev/null | grep -Fq "$source" ||
    omp plugin marketplace add "$source"
  install_plugin "$id" "$id"
}

#############################
#        Plugin list        #
#############################

install_plugin 'git:github.com/obra/superpowers@v7.0.2' '"name": "superpowers"'
install_plugin 'git:github.com/DietrichGebert/ponytail@v5.3.3' '"name": "@dietrichgebert/ponytail"'
install_marketplace_plugin 'pbakaus/impeccable' 'impeccable@impeccable'
install_marketplace_plugin 'JuliusBrussee/caveman' 'caveman@caveman'

if command -v npx >/dev/null 2>&1; then
  install_npx_plugin '.agents/skills/reverse-engineer-anything' \
    rea-agents@6.8.0 setup --skill-client omp --yes
fi
