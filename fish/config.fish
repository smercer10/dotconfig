# Remove greeting
set --universal fish_greeting ""

# Set up tool integrations
fzf --fish | source
zoxide init fish | source

# Aliases
alias hx="helix"
alias lg="lazygit"

# Open Yazi
function yy
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
