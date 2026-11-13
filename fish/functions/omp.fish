function omp
    set -l no_sandbox 0
    set -l omp_args

    for arg in $argv
        if test "$arg" = --no-sandbox
            set no_sandbox 1
        else
            set -a omp_args $arg
        end
    end

    if test $no_sandbox -eq 1
        command omp $omp_args
        return $status
    end

    # --bind $PWD would hand out $HOME (or /) writable when run from there
    if test (string sub -l (string length -- "$PWD") -- "$HOME") = "$PWD"
        echo "omp: refusing to sandbox from $PWD: that is \$HOME or an ancestor of it. cd into a project dir, or use --no-sandbox." >&2
        return 1
    end

    set -l joined_path (string join : "$HOME/.local/share/mise/shims" "$HOME/.bun/bin" "$HOME/.cargo/bin" "$HOME/go/bin" $PATH)

    bwrap \
        --ro-bind / / \
        --proc /proc \
        --dev /dev \
        --tmpfs /tmp \
        --tmpfs /run \
        --unsetenv DBUS_SESSION_BUS_ADDRESS \
        --unsetenv XDG_RUNTIME_DIR \
        --bind-try "$HOME/.cargo" "$HOME/.cargo" \
        --bind-try "$HOME/go" "$HOME/go" \
        --bind-try "$HOME/.cache" "$HOME/.cache" \
        --bind-try "$HOME/.npm" "$HOME/.npm" \
        --bind-try "$HOME/.rustup" "$HOME/.rustup" \
        --bind-try "$HOME/.bun" "$HOME/.bun" \
        --bind-try "$HOME/.impeccable" "$HOME/.impeccable" \
        --bind-try "$HOME/.local/state" "$HOME/.local/state" \
        --bind-try "$HOME/.local/share/pnpm" "$HOME/.local/share/pnpm" \
        --bind-try "$HOME/.local/share/uv" "$HOME/.local/share/uv" \
        --bind-try "$HOME/.local/share/mise/downloads" "$HOME/.local/share/mise/downloads" \
        --bind-try "$HOME/.local/share/mise/installs" "$HOME/.local/share/mise/installs" \
        --bind-try "$HOME/.local/share/mise/shims" "$HOME/.local/share/mise/shims" \
        --bind "$HOME/.omp" "$HOME/.omp" \
        --bind "$PWD" "$PWD" \
        --chdir "$PWD" \
        --setenv PATH "$joined_path" \
        --unshare-pid \
        --die-with-parent \
        (command -v omp) --append-system-prompt "You are running inside a bubblewrap (bwrap) sandbox. The filesystem is read-only except for $PWD, ~/.omp, /tmp and toolchain caches (~/.cargo, ~/.rustup, ~/.bun, ~/.npm, ~/.cache, ~/go, ~/.local/state, ~/.local/share/pnpm, ~/.local/share/uv, ~/.local/share/mise/{downloads,installs,shims}). Do not edit the global mise config (~/.config/mise): pin tools in the project's mise.toml and run in-project mise install. /run is a private tmpfs, so no D-Bus, X11, systemd or agent sockets are reachable. Do not attempt to modify files or configs outside those writable paths." $omp_args
end
