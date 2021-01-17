# Defined in - @ line 1
function sv --wraps='sudo nvim' --description 'alias sv=sudo nvim'
  sudo nvim $argv;
end
