# http://laravel-news.com/2014/07/laravel-bash-aliases

export HISTTIMEFORMAT="%d/%m/%y %T "

# would be nice to 'git fetch; git diff HEAD origin/master' to let me know if there's stuff I need to merge? or just auto-do it?

export EDITOR=vi
export VISUAL=vi
export TERM=vt100
export PAGER="less -i -m "

# https://github.com/Adron/bash-git-prompt

if [ -f ~/.dotfiles/.git-prompt.sh ]; then
  source ~/.dotfiles/.git-prompt.sh
  export PS1='\u@\h:\w$(__git_ps1 " (%s)")\$ '
else
  export PS1="\u@\h:\w\$ "
fi

# Usage: homestead up, homestead halt
alias homestead='function __homestead() { (cd ~/Documents/Code/Homestead && vagrant $*); unset -f __homestead; }; __homestead'

function function_exists {
    FUNCTION_NAME=$1
    [ -z "$FUNCTION_NAME" ] && return 1
    declare -F "$FUNCTION_NAME" > /dev/null 2>&1
    return $?
}

# global git hook templates - /usr/local/git/share/git-core/templates/hooks

# https://github.com/tj/git-extras/blob/master/Commands.md

alias g='git'
alias ga='git add '
alias gb='git branch '
alias gc='git checkout '
alias gd='git diff '
alias gf='git fetch '
alias gl='git log '
alias gs='git status '

alias master='git checkout master'

# http://ubuntuforums.org/showthread.php?t=733397

if ! function_exists _git_init && [ -f ~/.dotfiles/git-completion.bash ]; then
  source ~/.dotfiles/git-completion.bash
  if ! function_exists alias_completion && [ -f ~/.dotfiles/.bash_completion_alias.sh ]; then
    source  ~/.dotfiles/.bash_completion_alias.sh
  fi
  # http://ubuntuforums.org/showthread.php?t=733397
  complete -o default -o nospace -F _git g
  # complete -o bashdefault -o default -o nospace -F _alias_completion::gb gb
  complete -o default -o nospace -F _alias_completion::gb gb
  complete -o bashdefault -o default -o nospace -F _alias_completion::gc gc
  # complete -o bashdefault -o default -o nospace -F _alias_completion::gd gd
  complete -o bashdefault -o default -o nospace -F _alias_completion::gf gf
  complete -o bashdefault -o default -o nospace -F _alias_completion::gl gl
  # complete -o bashdefault -o default -o nospace -F _alias_completion::gs gs
  # complete -o default -o nospace -F _git_checkout gc
fi

alias psr2="~/bin/php-cs-fixer fix . --diff --dry-run --level=psr2 --fixers=psr1,-psr0,extra_empty_lines,short_array_syntax,whitespacy_lines,short_echo_tag,-eof_ending"

alias ba='. ~/.dotfiles/.bash_aliases'

alias dc='cd '
alias dir='ls -als'
alias du='du -k'
alias jobs='jobs -l'
alias ll='ls -la'
alias llm='ls -la | more'
alias ls='ls -CF'
alias more='less -i -m '
alias pd='pushd .'
alias pp='popd'
alias rs='set noglob; eval `resize >& /dev/null`; unset noglob'
alias search='find / -type f -print|xargs grep '
alias top='top -S -s 1'
alias mirror='wget -nH -np -r '
alias whois='whois -h whois.geektools.com '

# GIT ADD REMOTE - git remote add upstream https://github.com/octocat/Spoon-Knife.git

# alias cschooks='grep -R "fn_set_hook" * | sed "s/\([^:]*\).*fn_set_hook('\([^']*\)'.*/\1 - \2/"'
# alias ccache='php -r "apc_clear_cache(); apc_clear_cache(\"user\");"';

alias CPAN="perl -MCPAN -e 'install MIME::Parser'"

alias tarcp='tar cf - . | ( cd $1; tar xfp -)'

alias clear_cache='/etc/init.d/php-fpm restart'
alias getmyip='curl icanhazip.com'
alias githide='git update-index --assume-unchanged '
alias gitunhide='git update-index --no-assume-unchanged '
alias gitfetchall='git fetch --all --prune --tags'

# alias gbreak='git log --name-status --reverse master..origin/master'
# alias gclist='git log --oneline --reverse master..origin/master'
# alias gdiff='git diff master..origin/master'
# alias glist='git diff --name-status master..origin/master'
# alias glog='git log -p --stat origin/master'
# alias gmerge='git merge origin/master'
# alias gpushshow='git log --name-status origin/master..master'
# alias gshow='git show origin/master'

alias gbreak='git log --name-status --reverse HEAD..FETCH_HEAD'
alias gclist='git log --oneline --reverse HEAD..FETCH_HEAD'
alias gdiff='git diff HEAD..FETCH_HEAD'
alias gfile='git log -p -- '
alias ggraph='git log --all --graph --oneline --decorate'
alias ghead='git rev-parse --verify HEAD'
alias ghistory='git log --follow -p -- '
alias glast='git diff --name-status HEAD$1^ $1'
alias glint="git status -sb | awk '/s/{print $2}' | sed 1d | xargs -n1 php -l"
# alias glint='git status -sb | awk "/\s/{print \$2}" | sed 1d | xargs -n1 php -l'
# alias glint="git diff --name-status | awk '{ if ($1 != \"D\") print $2 }' | grep -e \.php$ | while read file; do RES=`php -l $file`; if [ $? -gt 0 ]; then echo \"$RES\"; else echo \"$file OK\"; fi; done"
alias glist='git diff --name-status HEAD..FETCH_HEAD'
alias glocal='git log --name-status master..HEAD '
alias glocaldiff='git log -p master..HEAD '
alias glog='git log -p --stat FETCH_HEAD'
alias gllog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gmerge='git merge --log FETCH_HEAD'
# alias gshowpush='git log --name-status FETCH_HEAD..HEAD'
alias gshowpush='git diff --cached `git rev-parse --abbrev-ref --symbolic-full-name @{u}`'
alias gremote='git remote show origin'
alias grshow='git show FETCH_HEAD'
alias glshow='git show --name-status --reverse '
alias gstage='git diff --cached'
alias gthis='git log master..HEAD'
# git checkout --track origin/remote-branch-name
alias gtrack='git checkout --track '
alias guser='git log --author="heybige" --name-status'
alias more='less -i -m'
alias src='cd ~/src'

# Mac Mini only
alias v='vagrant version && vagrant global-status'
alias vst='vagrant status'
alias vup='vagrant up'
alias vdo='vagrant halt'
alias vssh='vagrant ssh'
alias vkill='vagrant destroy'

alias pa="php artisan"
alias par="php artisan routes"
alias pam="php artisan migrate"
alias pam:r="php artisan migrate:refresh"
alias pam:roll="php artisan migrate:rollback"
alias pam:rs="php artisan migrate:refresh --seed"
alias pda="php artisan dumpautoload"
alias cu="composer update"
alias ci="composer install"
alias cda="composer dump-autoload -o"

alias vapro="curl -L http://bit.ly/vaprobash > Vagrantfile"

# netstat -plunt

biggest() {
    # http://www.cyberciti.biz/faq/how-do-i-find-the-largest-filesdirectories-on-a-linuxunixbsd-filesystem/
    if [[ ! -z $1 ]]; then
        DIR=$1
    else
        DIR=.
    fi
        
    du -a $DIR  | sort -n -r | head -n 10
}

laranew() {
	if [ "$1" ]; then
		composer create-project laravel/laravel $1 --prefer-dist
	else
		composer create-project laravel/laravel . --prefer-dist
	fi
}
