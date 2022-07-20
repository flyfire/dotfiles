# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="pygmalion"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man-pages colorize pip python brew macos)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# brew
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_EDITOR=vim
source ~/.homebrew_token
alias bu='brew update && brew upgrade $(brew list | grep -vE "typora|sogouinput")'

# ssh
eval "$(ssh-agent -s >/dev/null 2>&1)"
ssh-add --apple-use-keychain ~/.ssh/id_rsa.github >/dev/null 2>&1
ssh-add --apple-use-keychain ~/.ssh/id_rsa.wumii >/dev/null 2>&1
ssh-add --apple-use-keychain ~/.ssh/id_ed25519_gitee >/dev/null 2>&1

# path
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
export PATH="/Users/houruhou/wumii/phabricator/arcanist/bin:$PATH"
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
export JAVA_HOME=`/usr/libexec/java_home -v11`
export ANDROID_HOME="/Users/houruhou/Library/Android/sdk"
export ADT_HOME="/Users/houruhou/Library/Android/sdk"
export PATH=$ADT_HOME/tools:$ADT_HOME/platform-tools:$ADT_HOME/build-tools/32.0.0:$PATH
#hierarchyviewer
export ANDROID_HVPROTO=ddm

#locale
LANG=en_US.UTF-8
LANGUAGE=en_US.UTF-8
LC_CTYPE="en_US.UTF-8"
LC_NUMERIC="en_US.UTF-8"
LC_TIME="en_US.UTF-8"
LC_COLLATE="en_US.UTF-8"
LC_MONETARY="en_US.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_PAPER="en_US.UTF-8"
LC_NAME="en_US.UTF-8"
LC_ADDRESS="en_US.UTF-8"
LC_TELEPHONE="en_US.UTF-8"
LC_MEASUREMENT="en_US.UTF-8"
LC_IDENTIFICATION="en_US.UTF-8"
LC_ALL=en_US.UTF-8

# editor
export VISUAL=vim
export EDITOR=vim

# c++
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@11/include"
alias cppcompile='c++ -std=c++11 -stdlib=libc++'

# zsh
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    autoload -Uz compinit
    compinit
fi

# python
export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init -)"
export PYTHONHTTPSVERIFY=0

# function
function cdcls(){
    cd "$@";clear
}

function mkcd(){
    mkdir -p "$@";cd "$@";clear
}
function greps(){
    grep -i --color=auto -nrHi --exclude-dir={.git,.svn,lib,.gradle,.idea,captures,build,bin,gen} -E "$@" .
}
function cdls() {
    cd $1
    ls
}
function adblog() {
    suffix=`date +%F-%H-%M-%S`
    adb logcat -v threadtime | tee $suffix.log
}
function video_info() {
    ffprobe -select_streams v -show_entries format=duration,size,bit_rate,filename -show_streams -v quiet -of csv="p=0" -of json -i "$*" | less
}

function image_size() {
    sips -g pixelWidth -g pixelHeight "$*"
}


#alias
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias sl='ls'
alias l='ls'
alias grep='grep --color=auto -i '
alias cls='clear'
# http://www.apkfuns.com/git-self-history-log/
alias showme="git config user.email | xargs -n1 -I {} git log --pretty=format:"%h - %an, %ar : %s" --since=2.weeks --no-merges  --author={}"
alias adbc='adb logcat -c'

# proxy
export https_proxy=http://127.0.0.1:7890
export http_proxy=http://127.0.0.1:7890
export all_proxy=socks5://127.0.0.1:7890




source /Users/houruhou/.config/broot/launcher/bash/br

# autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# gitignore
# https://www.toptal.com/developers/gitignore/?templates=macos
# https://docs.gitignore.io/install/command-line
function gi() { curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;}

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
