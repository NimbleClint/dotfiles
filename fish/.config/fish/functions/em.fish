# Defined in - @ line 1
function em --wraps='emacsclient -c -t -a=' --description 'alias em=emacsclient -c -t -a='
  emacsclient -c -t -a= $argv;
end
