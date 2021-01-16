# Defined in - @ line 1
function rm --wraps='rm -ri' --description 'alias rm=rm -ri'
 command rm -ri $argv;
end
