#!/bin/bash

FILE_PATH="/home/$USER/Pictures/screenshots/screenshot-$(date -u +'%Y%m%d-%H%M%SZ').png"

main()
{
	case $1 in
        full) maim --format=png $FILE_PATH ;;
        select) maim --select $FILE_PATH ;;
        window) maim --window $(xdotool getactivewindow) $FILE_PATH
    esac
}

main "$@"
