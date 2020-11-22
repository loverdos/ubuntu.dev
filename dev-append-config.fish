set -gx SHELL /usr/bin/fish

set -gx DOTNET_CLI_TELEMETRY_OPTOUT 1

set -gx HOMEBREW_NO_ANALYTICS 1

set -gx CHOOSENIM_NO_ANALYTICS 1

set -gx OPAMVERBOSE yes
set -gx OPAMDEBUG 0
set -gx OPAMCOLOR always
set -gx OPAMSTATUSLINE always
set -gx OPAMUTF8MSGS yes

set -gx RUST_BACKTRACE 1

alias c cat
alias psg 'ps -ef | grep -i'
alias llg 'clear;ll | grep -i'
alias up 'cd ..'
alias up2 'cd ../..'
alias up3 'cd ../../..'
alias up4 'cd ../../../..'
alias up5 'cd ../../../../..'
alias du 'du -sm'

abbr -a get curl --xattr -LJO

function exa
  command exa -abglh@ --git --time-style long-iso $argv
end

function ll
  clear
  exa $argv; or ls -Al $argv
end

abbr -a l ll
abbr -a lll ll

function tmp
  if test -d tmp
    cd tmp
  else
    mkdir tmp
    tmp
  end
end

function pbcopy
  xsel --clipboard --input
end

function pbpaste
  xsel --clipboard --output
end

function which-package-provides --argument-names executable
  set -l executable (which $executable)
  dpkg -S $executable
end

function __fish_command_not_found_handler --on-event fish_command_not_found
  # make sure you have installed package `command-not-found`
  if test -x /usr/lib/command-not-found;
    /usr/lib/command-not-found --no-failure-msg -- $argv
  else
    PRINT_STDERR command $argv not found
    LOG You may want to install package command-not-found
  end
end

function update
  sudo apt update
end

function upgrade
  sudo apt upgrade
  sudo apt dist-upgrade
end

function prepend-PATH
  set -l P $argv[1]
  if test -d "$P";
    # set -x PATH (abs-folder "$P") $PATH
    set -x PATH "$P" $PATH
  end
end

function prepend-MANPATH
  set -l P $argv[1]
  if test -d "$P";
    set -x MANPATH "$P" $MANPATH
  end
end

function prepend-INFOPATH
  set -l P $argv[1]
  if test -d "$P";
    set -x INFOPATH "$P" $INFOPATH
  end
end

function show-ips
  ip addr show scope global |\
  grep inet |\
  grep -E '([0-9]+\.){3}[0-9]+' |\
  awk '{$1=$1;print}' |\
  sed 's/scope //'
end

function show-iface
  ip addr | awk '/state UP/ {print $2}' | cut -d : -f 1
end

# nix
if test -e ~/.nix-profile/bin; 
  set -l NIX_LINK ~/.nix-profile
  
  set -gx PATH $NIX_LINK/sbin $PATH
  set -gx PATH $NIX_LINK/bin  $PATH
  set -gx MANPATH $NIX_LINK/share/man $MANPATH

  set -gx NIX_PATH "nixpkgs=$HOME/.nix-defexpr/channels/nixpkgs"

  # debian, ubuntu
  set -x NIX_SSL_CERT_FILE /etc/ssl/certs/ca-certificates.crt
end

# java
function java-use-8
  update-alternatives --list java
  sudo update-alternatives --set java /usr/lib/jvm/java-8-*/jre/bin/java
  sudo -k
  java -version
end

function java-use-11
  update-alternatives --list java
  sudo update-alternatives --set java /usr/lib/jvm/java-11-*/bin/java
  sudo -k
  java -version
end

set -xg GOPATH ~/go

prepend-PATH ~/.config/yarn/global/node_modules/.bin
prepend-PATH ~/.nimble/bin
prepend-PATH ~/.luarocks/bin
prepend-PATH ~/.cabal/bin
prepend-PATH ~/.dotnet/tools
prepend-PATH ~/.nvm/versions/node/current/bin/
prepend-PATH $GOPATH/bin
prepend-PATH ~/.cargo/bin

# https://github.com/starship/starship
starship init fish | source