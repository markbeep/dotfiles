function omp
    set -l no_sandbox 0
    set -l omp_args

    for arg in $argv
        if test "$arg" = "--no-sandbox"
            set no_sandbox 1
        else
            set -a omp_args $arg
        end
    end

    if test $no_sandbox -eq 1
        command omp $omp_args
        return $status
    end

    set -l joined_path (string join : "$HOME/.local/share/mise/shims" "$HOME/.bun/bin" "$HOME/.cargo/bin" "$HOME/go/bin" $PATH)

    bwrap \
        --ro-bind / / \
        --proc /proc \
        --dev /dev \
        --tmpfs /tmp \
        --bind-try "$HOME/.cargo" "$HOME/.cargo" \
        --bind-try "$HOME/go" "$HOME/go" \
        --bind-try "$HOME/.cache" "$HOME/.cache" \
        --bind-try "$HOME/.npm" "$HOME/.npm" \
        --bind "$HOME/.omp" "$HOME/.omp" \
        --bind "$PWD" "$PWD" \
        --chdir "$PWD" \
        --setenv PATH "$joined_path" \
        --unshare-pid \
        --die-with-parent \
        (command -v omp) --append-system-prompt "You are running inside a bubblewrap (bwrap) sandbox. The entire filesystem is mounted read-only except for $PWD, ~/.pi, /tmp, and build caches (~/.cargo, ~/go, ~/.cache). Do not attempt to modify files or configs outside $PWD." $omp_args
end
