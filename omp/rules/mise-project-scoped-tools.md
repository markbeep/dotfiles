---
name: mise-project-scoped-tools
description: "Never install, upgrade, or pin mise tools globally (-g/--global); pin them in the project's mise.toml instead"
condition: ["mise\\s+use\\s+(-g\\b|--global\\b)", "mise\\s+install\\s+(-g\\b|--global\\b)", "mise\\s+upgrade\\s+(-g\\b|--global\\b)", "mise\\s+ls\\s+--global\\b"]
scope: ["tool:bash", "tool:write(local://*)", "tool:edit(local://*)", "text"]
---

NEVER install, upgrade, or pin mise tools globally. `mise use -g ...`, `mise install -g ...`, `mise upgrade -g ...` and `mise ls --global`-style global mutations touch the user's global config (`~/.config/mise/config.toml`) and change every project on the machine. This includes copying a subagent's recommendation (`mise use -g sqlc@1.31.1`, `mise use -g "go:github.com/pressly/goose/v3/cmd/goose@v3.28.0"`) into your own prose, a bash command, or a plan file — never relay it.

Declare every tool in THIS repo's `mise.toml` `[tools]` table, then provision with the in-project `mise install` (no flag):

```toml
[tools]
go = "1.27.1"
just = "latest"
node = "22"
sqlc = "1.31.1"
"go:github.com/pressly/goose/v3/cmd/goose" = "3.28.0"
```

When a tool is missing, prefer in order: (1) the project-pinned binary/shim once `mise.toml` declares it; (2) invoke the already-installed binary by absolute path (e.g. `~/.local/share/mise/installs/go-github-com-sqlc-dev-sqlc-cmd-sqlc/1.31.1/bin/sqlc`); (3) a one-off `go run <module>@<version>` / `npx <pkg>@<version>`; (4) add a pinned entry to `mise.toml`.

If a shim errors with "No version is set for shim: <tool>", the fix is a project `mise.toml` entry — do NOT satisfy it with the global command mise prints in its own hint.