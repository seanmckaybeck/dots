#!/bin/bash

wallpaper() {
    files=(~/wallpapers/*)
    feh --bg-scale "${files[ $(( $RANDOM%${#files[@]} )) ]}"
}

while true; do wallpaper; sleep 120; done
