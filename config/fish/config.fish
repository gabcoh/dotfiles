set -x PATH $PATH ~/.local/bin

set -x PAPERS  ~/Documents/papers
set -x SCRIPTS ~/code/scripts
set -x NOTES   ~/Documents/notes

set -x GOPATH ~/code/go

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/__tabtab.fish ]; and . ~/.config/tabtab/__tabtab.fish; or true
