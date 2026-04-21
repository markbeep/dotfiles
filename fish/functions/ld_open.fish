function ld_open --description 'Run fzf over linkding bookmarks and open the selected one'
    # Location of linkding config
    set config ~/.config/linkding.json
    
    # Initialize an empty variable to hold all results
    set all_results '[]'
    
    # Get the first page
    set response (linkding -c $config bookmarks all)
    
    # Merge pages until there is no "next"
    while true
        # Append current page results to all_results
        set page_results (echo $response | jq '.results')
        set all_results (echo $all_results $page_results | jq -s 'add')
        
        # Get next URL
        set next_url (echo $response | jq -r '.next')
        if test "$next_url" = "null"
            break
        end
        
        # Fetch next page
        set response (linkding -c $config bookmarks list --url "$next_url")
    end
    
    # Build a fuzzy list: show title + description, keep id + url in the background
    set selection (echo $all_results | jq -r '.[] | "\(.id)\t\(.title) — \(.description)\t\(.url)"' | \
                    fzf --with-nth=2 --delimiter='\t' --prompt="Select bookmark: ")
    
    # Exit if nothing selected
    if test -z "$selection"
        echo "No bookmark selected."
        return
    end
    
    # Extract URL (third tab-separated field)
    set url (echo $selection | awk -F'\t' '{print $3}')
    
    # Open the URL
    echo "Opening: $url"
    xdg-open $url >/dev/null 2>&1
end
