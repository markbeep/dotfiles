function image --description "Fzf search docker images"
    if test (count $argv) -eq 0
        echo "Usage: image <keyword>"
        return 1
    end

    set keyword $argv[1]

    docker search $keyword \
        | awk 'NR>1 {print $1}' \
        | fzf --prompt="Select image> " --height=40% \
        | read -l selected

    if test -z "$selected"
        return
    end

    # Official images have no author. We need to explicitly add `library`
    if string match -q '*/*' $selected
        set urlselected $selected
    else
        set urlselected library/$selected
    end

    set url https://hub.docker.com/v2/repositories/$urlselected/tags
    set tags ""

    printf "Loading tags for %s...\n" $selected

    for i in (seq 1 5)
        set response (curl --silent $url)
        if test -z "$response"
            break
        end

        # Append tag names from this page
        set tags $tags (echo $response | jq -r '.results[].name')

        # Get the 'next' URL
        set next (echo $response | jq -r '.next')

        # Stop if no next page
        if test "$next" = null -o -z "$next"
            break
        end

        set url $next
    end

    if test (count $tags) -gt 0
        printf "%s\n" $tags \
            | fzf --prompt="Select tag> " --height=40% \
            | read -l selectedtag

        if test -n "$selectedtag"
            echo "======= Done ======="
            set response (printf "FROM %s:%s\n" $selected $selectedtag)
            echo -e "\e[1;34m$response\e[0m"
            wl-copy "$response"
        end
    else
        echo "No tags found for $selected"
    end
end
