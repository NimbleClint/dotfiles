# Defined in - @ line 1
function rm --wraps='rm -ri' --wraps='echo "Do not use rm to delete files. Use del instead."; false' --description 'alias rm=echo "Do not use rm to delete files. Use del instead."; false'
  echo "Do not use rm to delete files. Use del instead."; false $argv;
end
