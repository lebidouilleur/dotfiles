### library.sh ---                                    -*- mode: shell-script; -*-

## Copyright (C) 2022  lebidouilleur

## Author: lebidouilleur <lebidouilleur@icloud.com>
## Keywords:

### Commentary:

##

### Code:





# assert ========================================================================
# colors ========================================================================
TEXT_RESET="\033[0m"
TEXT_BOLD="\033[1m"
TEXT_DIM="\033[2m"
TEXT_UNDERLINE="\033[4m"
TEXT_BLINK="\033[5m"
TEXT_REVERSE="\033[7m"
TEXT_HIDDEN="\033[8m"
TEXT_DEFAULT="\033[39m"
TEXT_FOREGROUND_BLACK="\033[30m"
TEXT_FOREGROUND_RED="\033[31m"
TEXT_FOREGROUND_GREEN="\033[32m"
TEXT_FOREGROUND_YELLOW="\033[33m"
TEXT_FOREGROUND_BLUE="\033[34m"
TEXT_FOREGROUND_MAGENTA="\033[35m"
TEXT_FOREGROUND_CYAN="\033[36m"
TEXT_FOREGROUND_LIGHT_GRAY="\033[37m"
TEXT_FOREGROUND_DARK_GRAY="\033[90m"
TEXT_FOREGROUND_LIGHT_RED="\033[91m"
TEXT_FOREGROUND_LIGHT_GREEN="\033[92m"
TEXT_FOREGROUND_LIGHT_YELLOW="\033[93m"
TEXT_FOREGROUND_LIGHT_BLUE="\033[94m"
TEXT_FOREGROUND_LIGHT_MAGENTA="\033[95m"
TEXT_FOREGROUND_LIGHT_CYAN="\033[96m"
TEXT_FOREGROUND_WHITE="\033[97m"
TEXT_BACKGROUND_BLACK="\033[40m"
TEXT_BACKGROUND_RED="\033[41m"
TEXT_BACKGROUND_GREEN="\033[42m"
TEXT_BACKGROUND_YELLOW="\033[43m"
TEXT_BACKGROUND_BLUE="\033[44m"
TEXT_BACKGROUND_MAGENTA="\033[45m"
TEXT_BACKGROUND_CYAN="\033[46m"
TEXT_BACKGROUND_LIGHT_GRAY="\033[47m"
TEXT_BACKGROUND_DARK_GRAY="\033[100m"
TEXT_BACKGROUND_LIGHT_RED="\033[101m"
TEXT_BACKGROUND_LIGHT_GREEN="\033[102m"
TEXT_BACKGROUND_LIGHT_YELLOW="\033[103m"
TEXT_BACKGROUND_LIGHT_BLUE="\033[104m"
TEXT_BACKGROUND_LIGHT_MAGENTA="\033[105m"
TEXT_BACKGROUND_LIGHT_CYAN="\033[106m"
TEXT_BACKGROUND_WHITE="\033[107m"



# logging =======================================================================
printl() {
    if [ ${#} -eq 0 ]; then
        echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: ${TEXT_FOREGROUND_RED}error${TEXT_RESET}: wrong number of arguments" >&2
    elif [ ${#} -eq 1 ]; then
        echo "[$(date +'%Y-%m-%d %H:%M:%S')]: ${1}"
    else
        header="${1}"
        shift
        case "${header}" in
            error|err)    printf "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: ${TEXT_FOREGROUND_RED}error${TEXT_RESET}: ${@}\n" >&2 ;;
            warning|warn) printf "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: ${TEXT_FOREGROUND_YELLOW}warning${TEXT_RESET}: ${@}\n" >&2 ;;
        esac
    fi
}


print_error() {
    printl "error" "${*}"
}


print_warning() {
    printl "warning" "${*}"
}
