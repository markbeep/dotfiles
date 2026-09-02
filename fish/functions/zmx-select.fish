function zmx-select --description "Select a zmx session to attach to"
    set -l prefix "$ZMX_SESSION_PREFIX"
    set -l display (zmx list 2>/dev/null | while read -l -d \t name pid clients created dir
        set name (string replace -r '^.*name=' '' -- $name)
        set pid (string replace -r '^.*pid=' '' -- $pid)
        set clients (string replace -r '^.*clients=' '' -- $clients)
        set dir (string replace -r '^.*start_dir=' '' -- $dir)

        if test -n "$prefix"
            string match -q "$prefix*" -- $name; or continue
            set name (string replace "$prefix" '' -- $name)
        end

        printf "%-20s  pid:%-8s  clients:%-2s  %s\n" "$name" "$pid" "$clients" "$dir"
    end)

    set -l output (
        if test -n "$display"
            printf "%s\n" $display
        end | fzf \
            --print-query \
            --expect=ctrl-n \
            --height=80% \
            --reverse \
            --prompt="zmx> " \
            --header="Enter: select | Ctrl-N: create new" \
            --preview='zmx history {1}' \
            --preview-window=right:60%:follow
    )
    set -l rc $status

    set -l query $output[1]
    set -l key $output[2]
    set -l selected $output[3]
    set -l session_name

    if test "$key" = "ctrl-n" -a -n "$query"
        set session_name "$query"
    else if test $rc -eq 0 -a -n "$selected"
        set session_name (string split -n ' ' -- $selected)[1]
    else if test -n "$query"
        set session_name "$query"
    else
        return 130
    end

    zmx attach "$session_name"
end
