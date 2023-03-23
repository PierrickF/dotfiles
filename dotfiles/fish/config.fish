if status is-interactive
    # Commands to run in interactive sessions can go here
end

# remove greeting prompt
set -U fish_greeting

# remove path underlining
set fish_color_valid_path

# fix for "alacritty unknown terminal type" in SSH
set TERM "xterm-256color"

# aliases
alias bye="i3-msg exit"
alias rustbook="rustup doc --book"
alias disable_gpu="optimus-manager --no-confirm --switch integrated"
alias rm_deps="sudo pacman -Rsn $(pacman -Qdtq)"

# variables
set -Ux BROWSER firefox
set -Ux EDITOR nvim

# functions
function bats
	BATS_RUN_SKIPPED=true command bats *.bats
end

function twitch
	while not streamlink twitch.tv/"$argv" best
		sleep 60
	end
end
