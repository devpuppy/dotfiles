require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 200
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"

# fake git commands
def st; 'st'; end
def git(cmd); puts `git #{cmd}`; end
