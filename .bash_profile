# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Add bash_scripts to the `$PATH`
export PATH="$PATH:$HOME/.bash_scripts"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
for file in ~/.{bashrc,exports,aliases}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

mp4togif(){
    ffmpeg -i "$1" -vf scale=1:1 -r 10 -f image2pipe -vcodec ppm - |\
    convert -delay 5 -layers Optimize -loop 0 - "$2"
}

gcob() {
  local format branch branches
  format="%(committerdate:relative)\\%(color:green)%(refname:short)%(color:reset)\\%(HEAD)\\%(color:yellow)%(objectname:short)%(color:reset) %(upstream:trackshort)\\%(contents:subject)"
  branches=$(git for-each-ref --format="$format" --sort=-committerdate refs/heads/ | column -t -s "\\") &&
  branch=$(echo "$branches" | fzf --ansi --height=30) &&
  git checkout $(echo "$branch" | awk '{print $4}')
}

if [ -z "$PS1" ]; then
  # This shell is not interactive
  return;
else
  [ -r ~/.bash_prompt ] && [ -f ~/.bash_prompt ] && source ~/.bash_prompt;
fi

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Add tab completion for many Bash commands
if which brew > /dev/null && [ -f "$(brew --prefix)/etc/bash_completion" ]; then
  source "$(brew --prefix)/etc/bash_completion";
elif [ -f /etc/bash_completion ]; then
  source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal" killall;

# Setup rbenv
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/shims:$PATH"

# Easy dir swapping for projects
test -e ~/projects/me && export CDPATH=.:$CDPATH:~/projects/me
test -e ~/projects/work && export CDPATH=.:$CDPATH:~/projects/work

eval "$(hub alias -s)"
