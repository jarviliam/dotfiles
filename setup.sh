#!/bin/env bash

GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
BGREEN='\033[1;32m'
BYELLOW='\033[1;33m'
BBLUE='\033[1;34m'
NC='\033[0m'

DOTFILES_DIR=$(git rev-parse --show-toplevel)

sym_link(){
    if [["$1" == "/"*]]; then
        DIR=$(echo "$1" | grep -o ".*\/")
        mkdir -p "$HOME/$DIR"
    fi
    ln -sf "$DOTFILES_DIR/$1" "$HOME/$1"
}
