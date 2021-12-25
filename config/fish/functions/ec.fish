# Defined in - @ line 1
function ec --wraps='emacsclient -nw' --description 'alias ec=emacsclient -nw'
  emacsclient -nw $argv;
end
