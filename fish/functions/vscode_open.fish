function vscode_open --description "Open a VSCode workspace as a devcontainer"
    # Shows all directories with a .devcontainer directory
    # - Initial fzf is sorted most recent edited. Most recent at the bottom.
    # - sed to shorten the path
    # - awk colors the final directory blue and bold
    set -l directory (
      fd -H --type d '^.devcontainer$' ~/Documents --exec dirname |\
        xargs ls -td |\
        sed 's|^/home/mark/Documents/|~/D/|' |\
        awk -F/ '{OFS="/"; last=$NF; $NF="\033[1;34m"last"\033[0m"; print}' |\
        fzf --ansi --prompt="VSCode Recent> "
    )
    if test -n "$directory"
        set -l formatted (echo $directory | sed 's|/D/|/Documents/|')
        sh -c "cd $formatted && devcontainer open"
    end
end
