#!/bin/bash

#
# Set Colors
#

export TERM=xterm-256color

bold=$(tput bold)
underline=$(tput sgr 0 1)
reset=$(tput sgr0)
purple=$(tput setaf 171)
red=$(tput setaf 1)
green=$(tput setaf 76)
tan=$(tput setaf 3)
blue=$(tput setaf 38)

#
# Headers and  Logging
#

e_header() {
    message="$@"
    len=$((${#message}+10))
    printf "\n${bold}${purple}"
    repeat $len printf "="
    printf "\n==== $@ ====\n"
    repeat $len printf "="
    printf  "${reset}\n\n"
}

e_arrow() {
    printf "➜ $@\n"
}

e_success() {
    printf "${green}✔ %s${reset}\n" "$@"
}

e_error() {
    printf "${red}✖ %s${reset}\n" "$@"
}

e_warning() {
    printf "${tan}➜ %s${reset}\n" "$@"
}

e_underline() {
    printf "${underline}${bold}%s${reset}\n" "$@"
}

e_bold() {
    printf "${bold}%s${reset}\n" "$@"
}

e_note() {
    printf "${blue}%s${reset}\n" "$@"
}

#
# Confirmation
#

seek_confirmation() {
    read "REPLY?${bold}$@${reset} (y/n): "
}

is_confirmed() {
    if [[ "$REPLY" =~ ^[Yy]$ ]]; then
        return 0
    fi
    return 1
}
