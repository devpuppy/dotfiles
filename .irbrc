require 'irb/ext/save-history'
if IRB.respond_to?(:conf)
  IRB.conf[:SAVE_HISTORY] = 200
  IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"
end

# grab my User, probably
def me
  eval "@me ||= User.find_by_email(`git config user.email`.strip)"
end

# fake git commands
def st; 'st'; end
def git(cmd); puts `git #{cmd}`; end
