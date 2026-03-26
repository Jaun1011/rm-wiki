#!/bin/bash

MIRROR=https://github.com/Pagefind/pagefind/releases/download

VERSION=v1.4.0

FILE=pagefind-$VERSION-aarch64-unknown-linux-musl.tar.gz

URL=$MIRROR/$VERSION/$FILE

function pagefinder_download(){
    echo "[INFO] pagefinder download $URL"

    wget $URL

    tar -xzf $FILE
    rm $FILE
}


function pagefinder_index(){
    echo "[INFO] pagefinder create index"
    ./pagefind --site public
}


function main(){
    pagefinder_download
    pagefinder_index
}

main