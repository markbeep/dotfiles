if status is-interactive
    # removes fish greeting
    set fish_greeting

    alias v='nvim .'
    abbr vim nvim
    set -gx EDITOR nvim

    #set -gx PATH $HOME/.local/bin $HOME/.krew/bin $HOME/.cargo/bin $HOME/Documents/Programming/ecode/.venv/bin/ecode $PATH
    set -q KREW_ROOT; and set -gx PATH $PATH $KREW_ROOT/.krew/bin; or set -gx PATH $PATH $HOME/.krew/bin

    abbr dup 'docker compose up --build'
    abbr ddown 'docker compose down'
    abbr duw 'docker compose watch --no-up & docker compose up --build'
    abbr d docker

    # silverblue specific
    abbr db distrobox
    abbr dbc distrobox create --name
    abbr fp flatpak
    abbr ro rpm-ostree

    # arch specific
    # fzf for pacman
    abbr pc "pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
    abbr yc "yay -Slq | fzf --multi --preview 'yay -Si {1}' | xargs -ro yay -S"
    alias c "fish -c 'cd ~/.config/aconfmgr && nvim .'"
    alias dots "fish -c 'cd ~/.dotfiles && dotter deploy'"
    abbr aconfsave "dots && aconfmgr save"

    abbr sr "systemctl reboot"
    abbr g git
    abbr l ls -lha

    # VIS kubectl commands
    abbr kb kubectl
    abbr kbs "kubectl -n vis-cat-staging"
    abbr kbp "kubectl -n vis-cat-prod"

    abbr yd "yarn dev"
    abbr yi yarn
    abbr nd "npm run dev"
    abbr ni "npm i"
    abbr ssh-keygen "ssh-keygen -t ed25519"

    # makes fzf ignore files located in .grepignore
    fzf --fish | source
    set -gx FZF_ALT_C_COMMAND 'fd --type d'

    # atuin needs to init AFTER fzf for Ctrl-R to work
    atuin init fish --disable-up-arrow | source
    starship init fish | source
    kubectl completion fish | source
    mise activate fish | source
    # hister completion fish | source

    function to64 -d "Encode to base64"
        echo -n "$argv" | base64 -w 0
        # print newline to prevent ⏎ from being printed by fish
        echo
    end

    function tmp -d "Create temp file and open it with the default editor"
        set tmpfile (mktemp /tmp/tmp.XXXXXXX.$argv)
        $EDITOR $tmpfile
        set_color green
        echo $tmpfile
    end

    function tmpdir -d "Create and enter temp dir"
        cd (mktemp -d)
    end

    function yeet -d "Run a command in the background. -q/--quit to kill shell."
        # parse args
        set --local options (fish_opt -s q -l quit)
        argparse $options -- $argv
        # run command in background
        nohup $argv &>/dev/null &
        if set --query _flag_quit
            disown
            kill $KITTY_PID
        end
        set_color yellow
        echo -n "Yeeted "
        set_color normal
        echo $argv
    end

    function rm-ex -d "Delete all files except the one specified"
        set -l files (find . -not -name $argv)
        set_color red
        echo "Deleting:"
        for file in $files
            if test "$file" != "." -a "$file" != ".." -a "$file" != "$argv"
                echo "  - $file"
            end
        end

        # confirm
        set_color normal
        read -l confirm -P "Are you sure? (Y/n) "

        if test "$confirm" = n
            echo "Operation canceled."
            return 1
        end

        for file in $files
            if test "$file" != "." -a "$file" != ".." -a "$file" != "$argv"
                rm -r $file
            end
        end
    end

    function initdev -d "Create .devcontainer dir, JSON file and empty Dockerfile"
        mkdir .devcontainer -p
        touch .devcontainer/Dockerfile
        echo -en '{\n    "name": "Existing Dockerfile",\n    "build": {\n        "context": "..",\n        "dockerfile": "./Dockerfile"\n    },\n    "runArgs": ["--network=host"],\n    "customizations": {\n        "vscode": {\n            "extensions": []\n        }\n    }\n}' >>.devcontainer/devcontainer.json
    end
end
