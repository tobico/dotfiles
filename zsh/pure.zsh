# Pure
# by Sindre Sorhus
# https://github.com/sindresorhus/pure
# MIT License


# Change this to your own username
DEFAULT_USERNAME='tobias'

# Threshold (sec) for showing cmd exec time
CMD_MAX_EXEC_TIME=5


# For my own and others sanity
# git:
# %b => current branch
# %a => current action (rebase/merge)
# prompt:
# %F => color dict
# %f => reset color
# %~ => current path
# %* => time
# %n => username
# %m => shortname host
# %(?..) => prompt conditional - %(condition.true.false)

autoload -U colors && colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git # You can add hg too if needed: `git hg`
zstyle ':vcs_info:git*' formats ' %b'
zstyle ':vcs_info:git*' actionformats ' %b|%a'

# Only show username if not default
[ $USER != $DEFAULT_USERNAME ] && local username='%n@%m '

# Fastest possible way to check if repo is dirty
git_dirty() {
	git diff --quiet --ignore-submodules HEAD 2>/dev/null; [ $? -eq 1 ] && echo '*'
}

# Displays the exec time of the last command if set threshold was exceeded
cmd_exec_time() {
	local stop=`date +%s`
	local start=${cmd_timestamp:-$stop}
	let local elapsed=$stop-$start
	[ $elapsed -gt $CMD_MAX_EXEC_TIME ] && echo ${elapsed}s
}

preexec() {
	cmd_timestamp=`date +%s`
}

precmd() {
	vcs_info

	[[ -n "$username" ]] && display_username="%{$bg[red]%} $username"
	vcs=""
	[[ -n "$vcs_info_msg_0_" ]] && vcs="%{$bg[blue]%}$vcs_info_msg_0_`git_dirty` "
	[[ "$vcs_info_msg_0_" == *master* ]] && vcs="%S%{$bg[yellow]%} ⚠️ $vcs_info_msg_0_ ⚠️  %s"
	exec_time=`cmd_exec_time`
	[[ -n "$exec_time" ]] && exec_time="%{$bg[yellow]%} $exec_time "

	print -P "\n%{$fg[black]%}%{$bg[green]%} %~ $display_username$exec_time$vcs%{$reset_color%}"

	# Reset value since `preexec` isn't always triggered
	unset cmd_timestamp
}

PROMPT='%F{magenta}>%f '
