function paruz
    set -l pkgs (
      paru -Sl |\
      sed -e "s: :/:; s/ unknown-version//; /installed/d" |\
      fzf --multi --ansi --preview "paru -Si {1}"
    )
    if test -z "$pkgs"
        return
    end
    echo $pkgs | awk '{print $1}' | xargs -ro paru -S
end
