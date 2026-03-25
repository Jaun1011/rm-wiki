#!/bin/bash
#################################################################################
# author:      jaun1011
# date:        24.3.2026
#
# precodition: branch must be existing
#
# description:
#   the script does the following steps:
#   1) builds with hugo an artifact
#   2) copies it to tmp
#   3) moves tmp to the root folder
#   4) removes all unneccessary files
#   5) pushes the files to a git build branch  
#
#################################################################################

BUILD_EMAIL="build@0x86.xyz"
BUILD_USER="build"
BUILD_MESSAGE="build by github action"

GIT_BRANCH_TARGET="build/gh-page"

CNAME_URL="wiki.0x86.xyz"


function git_setup(){
    
    git config --global user.email $BUILD_EMAIL
    git config --global user.name  $BUILD_USER

    echo "[INFO] git config setup"
}

function git_checkout(){
    
    git fetch  --all
    git checkout -f $GIT_BRANCH_TARGET 
 
    echo "[INFO] git branch checkout made:"
    git branch
}

function git_push(){
    
    git checkout -f $GIT_BRANCH_TARGET

    git add .
    git commit -m "$BUILD_MESSAGE" --allow-empty
    #git push 

    echo "[INFO] git pushed to $GIT_BRANCH_TARGET"
}

function run_build(){
    hugo --minify  

    echo "$CNAME_URL" > public/CNAME
        
    mkdir tmp

    mv public/* tmp
    rm -r $( printf '%s\n' * | grep -Ewv ".git|tmp" )
    mv tmp/* ./
    rm -r tmp
}


function main(){

    echo "[INFO] buildscript is running"

    git_setup
    run_build
    git_checkout
    git_push
}

main