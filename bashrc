if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now
	return
fi

# Shell options
shopt -s cdspell
shopt -s checkhash
shopt -s checkwinsize
shopt -s cmdhist
shopt -s extglob
shopt -s histappend

if [[ ${BASH_VERSINFO[0]} -ge 4 ]]; then
    shopt -s autocd
    shopt -s dirspell
fi

# Perlbrew
if [[ -e ~/.perlbrew/etc/bashrc ]]; then
    source ~/.perlbrew/etc/bashrc
fi

# Programmable completion
if [[ -e /etc/bash_completion ]]; then
    source /etc/bash_completion
elif [[ -e /opt/local/etc/bash_completion ]]; then
    source /opt/local/etc/bash_completion
fi

# Autojump
if [[ -e /etc/profile.d/autojump.bash ]]; then
    source /etc/profile.d/autojump.bash
fi

source ~/.bashrc_scripts/colors.sh
source ~/.bashrc_scripts/functions.sh
source ~/.bashrc_scripts/aliases.sh
source ~/.bashrc_scripts/env.sh

# Site-specific customizations
if [[ -e ~/.bashrc_scripts/local.sh ]]; then
    source ~/.bashrc_scripts/local.sh
fi

# Bash::Completion plugins
if [ which setup-bash-complete 2>/dev/null ]; then
    setup-bash-complete
fi

set -o noclobber

ls_limited
