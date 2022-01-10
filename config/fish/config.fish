set -x PATH $PATH ~/.local/bin

set -x PAPERS  ~/Documents/papers
set -x SCRIPTS ~/code/scripts
set -x NOTES   ~/Documents/notes

set -x GOPATH ~/code/go

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# See https://github.com/flameshot-org/flameshot/blob/master/docs/Sway%20and%20wlroots%20support.md
set -x SDL_VIDEODRIVER "wayland"
set -x _JAVA_AWT_WM_NONREPARENTING "1"
set -x  QT_QPA_PLATFORM "wayland"
set -x XDG_CURRENT_DESKTOP "sway"
set -x XDG_SESSION_DESKTOP "sway"