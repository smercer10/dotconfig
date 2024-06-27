# Remove greeting
set --universal fish_greeting ""

# Set up tool integrations
fzf --fish | source
zoxide init fish | source

# Aliases
alias hx="helix"
alias lg="lazygit"
alias cd="z"
alias ls="eza -a -l --icons --no-user"

# Open Yazi
function yy
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# opam configuration
source /home/sam/.opam/opam-init/init.fish >/dev/null 2>/dev/null; or true
