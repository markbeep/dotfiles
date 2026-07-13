function dir_open --description "Shows all directories in ~/Documents, then opens the directory."
    # - Initial fzf is sorted most recent edited. Most recent at the bottom.
    # - sed to shorten the path
    # - awk colors the final directory blue and bold
    set -l directory (
      fd . --type d ~/Documents |\
        xargs -d '\n' ls -td |\
        sed 's|/$||' |\
        sed 's|^/home/mark/Documents/|~/D/|' |\
        awk -F/ '{OFS="/"; last=$NF; $NF="\033[1;34m"last"\033[0m"; print}' |\
        fzf --ansi --prompt="Zed Recent> "
    )
    if test -n "$directory"
        set -l clean_dir (string replace -ra '\e\[[0-9;]*m' '' -- "$directory")
        set -l formatted (echo "$clean_dir" | sed 's|^~/D/|/home/mark/Documents/|')
        yeet kitty "$formatted"
    end
end
