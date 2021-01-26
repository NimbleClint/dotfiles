# Defined in - @ line 1
function sem --wraps='sudo emacsclient -c -t -a=' --description 'alias sem=sudo emacsclient -c -t -a='
  sudo emacsclient -c -t -a= $argv;
end
