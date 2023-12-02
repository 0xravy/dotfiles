eval "$(oh-my-posh init zsh --config $HOME/.cache/oh-my-posh/themes/amro.omp.json)"

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh)"
fi


# ZSH_THEME="archcraft"

# zstyle ':omz:update' mode disabled  # disable automatic updates


plugins=(
	zsh-vi-mode
	zsh-autosuggestions

	zsh-syntax-highlighting
	git
)


export LANG=en_US.UTF-8

export EDITOR='nvim'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}

add-zsh-hook -Uz precmd rehash_precmd

# ls
alias l='ls -lh'
alias ll='ls -lah'
alias la='ls -A'
alias lm='ls -m'
alias lr='ls -R'
alias lg='ls -l --group-directories-first'

# git
alias gcl='git clone --depth 1'
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push origin master'

# my-cmd
alias c='clear'
alias n='nvim'
alias rn='ranger'
alias b='btop'


# bun completions
[ -s "/home/ravy/.bun/_bun" ] && source "/home/ravy/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

