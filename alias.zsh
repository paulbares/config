# You can put files here to add functionality separated per file, which
# will be ignored by git.
# Files on the custom/ directory will be automatically loaded by the init
# script, in alphabetical order.

# For example: add yourself some shortcuts to projects you often work on.
#
# brainstormr=~/Projects/development/planetargon/brainstormr
# cd $brainstormr
#

#   -------------------------------
#    MAKE TERMINAL BETTER
#   -------------------------------

# Maven
alias mci="mvn clean install"
alias mcint="mci -DskipTests"
alias mcins="mci -Dcheckstyle.skip"
alias mcinsnt="mcint -Dcheckstyle.skip"
alias mcintns="mcint -Dcheckstyle.skip"

# GIT
alias gitcm="git commit -m"
alias git_current_branch="git rev-parse --symbolic-full-name --abbrev-ref HEAD"

# Dev
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias fzfp="fzf --preview 'cat {}'"
alias load_java14="export JAVA_HOME=\"/Users/Paul.Bares/opt/jdk-14.0.1.jdk/Contents/Home\""

# MISC
alias starttools="/Applications/Slack.app/Contents/MacOS/Slack > /dev/null 2>&1 & \
				   /Applications/Microsoft\ Teams.app/Contents/MacOS/Teams > /dev/null 2>&1 &\
				   /Applications/Microsoft\ Outlook.app/Contents/MacOS/Microsoft\ Outlook > /dev/null 2>&1 &"
alias stoptools="killall -9 Slack & killall -9 Teams & killall -9 Microsoft\ Outlook"
alias killnginx="ps aux  | grep nginx | awk  '{print $2}' | xargs kill -9"

# -------------------------------
# FUNCTIONS
# -------------------------------
git_update_branch () {
	local currentBranch="$(git_current_branch)"
	echo "Updating the branch $currentBranch"
	git co "$1" && git pull && git co "$currentBranch" && git merge "$1"
}

mcd() { mkdir  -p $1; cd $1 }
cdl() { cd $1; ls}
gfind() { find / -iname $@ 2>/dev/null }
lfind() { find . -iname $@ 2>/dev/null }
