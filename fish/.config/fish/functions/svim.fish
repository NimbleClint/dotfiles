# Defined in - @ line 1
function svim --wraps='sudo nvim' --description 'alias svim=sudo nvim'
  sudo nvim $argv;
end
