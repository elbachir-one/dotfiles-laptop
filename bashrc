#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias a='alsamixer'
alias x='helix'
alias v='vim'
alias nv='nvim'
alias ls='lsd --color=auto'
alias l='lsd -al'
alias i='sudo pacman -S'
alias u='sudo pacman -Syu'
alias q='sudo pacman -Ss'
alias p='sudo poweroff'
alias r='sudo reboot'
alias mi='sudo make clean install'
alias m='cmus'
alias n='mpd && ncmpcpp'
alias V='mpv'
alias nv='nvim'
alias h='htop'
alias g='ranger'
alias y='yt-dlp'
alias yl='yt-dlp -F'
alias ya='yt-dlp -f 140'
alias yd='yt-dlp -c --batch-file='~/p.txt''
alias s='source ~/.bashrc'
alias gt='git clone'
alias c='sudo pacman -Sc'
alias t='tmux'
#PS1='\W $ '

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

export PS1="\h\[\e[34m\]\w\[\e[m\]\[\e[35m\]\`parse_git_branch\`\[\e[m\] \[\e[31m\]\\$\[\e[m\] "

#

alias f='ffmpeg -video_size 1366x768 -framerate 30 -f x11grab -i :0.0+0,0 output.mkv'
alias ff='ffmpeg -video_size 1920x1080 -framerate 30 -f x11grab -i :0.0+0,0 output.mkv'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
