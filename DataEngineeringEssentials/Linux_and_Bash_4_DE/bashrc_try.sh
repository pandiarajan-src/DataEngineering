export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

export OPENAI_API_KEY='API goes here'
export PATH=/usr/local/anaconda3/bin:$PATH
export PATH=/opt/homebrew/anaconda3/bin:$PATH

export JAVA_HOME=/usr/bin/java
export PATH=$JAVA_HOME/bin:$PATH

export GPG_TTY=/dev/ttys007

# Alias
alias src="cd /Users/user/source"

autoload bashcompinit && bashcompinit
source $(brew --prefix)/etc/bash_completion.d/az

# Function to display disk usage
disk_usage() {
    # Use the df command to get disk usage for the root (/) filesystem
    # -h flag provides human-readable output (in KB, MB, GB)
    # grep -w "/" filters for the root filesystem
    df -h / | awk 'NR==2 {print "Total: " $2 "\nUsed: " $3 "\nFree: " $4 "\nUsage: " $5}'
}

# Call the function to print the disk usage
disk_usage

