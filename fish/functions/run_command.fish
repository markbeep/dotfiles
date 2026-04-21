function run_command --description 'Select what custom fzf command to run using, you guessed it, fzf'
    # Define commands as name=command pairs
    # NOTE: arrow is a single '→' character
    set commands \
        "Install package → paruz" \
        "Open VSC workspace → vscode_open" \
        "Open Zed workspace → zed_open" \
        "Open linkding bookmark → ld_open" \
        "Reload touchpad kernel → reload_touchpad"

    # Use fzf to select a command (showing the pretty names)
    set selection (printf '%s\n' $commands | fzf --prompt="Select a command: ")

    # If user pressed ESC or nothing was selected, exit gracefully
    echo $selection
    if test -z "$selection"
        echo "No command selected."
        return
    end

    # Extract the actual command (the part after the arrow)
    set cmd (string split "→" $selection)[2]
    echo $cmd
    set cmd (string trim $cmd)

    # Confirm and execute
    echo "Running: $cmd"
    eval $cmd
end
