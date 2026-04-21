function send-discord --description 'Send a file to discord'
    if test (count $argv) -eq 0
        echo "Usage: send-discord <path>"
        return 1
    end
    set path $argv[1]
    # webhook set by fish/conf.d/discord.fish
    curl -F "file=@$path" "$discord_webhook"
end
