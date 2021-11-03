### colors.lib.bash ---                              -*- mode: shell-script; -*-

## Copyright (C) 2021  lebidouilleur

## Author: lebidouilleur <lebidouilleur@icloud.com>
## Keywords:

## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.

## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.

## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

### Commentary:

##

### Code:



TEXT_FORMAT_RESET="\[\e[0m\]"


TEXT_FORMAT_BOLD="\[\e[1m\]"
TEXT_FORMAT_DIM="\[\e[2m\]"
TEXT_FORMAT_UNDERLINE="\[\e[4m\]"
TEXT_FORMAT_BLINK="\[\e[5m\]"
TEXT_FORMAT_REVERSE="\[\e[7m\]"
TEXT_FORMAT_HIDDEN="\[\e[8m\]"


TEXT_FORMAT_DEFAULT="\[\e[39m\]"


TEXT_FORMAT_FOREGROUND_BLACK="\[\e[30m\]"
TEXT_FORMAT_FOREGROUND_RED="\[\e[31m\]"
TEXT_FORMAT_FOREGROUND_GREEN="\[\e[32m\]"
TEXT_FORMAT_FOREGROUND_YELLOW="\[\e[33m\]"
TEXT_FORMAT_FOREGROUND_BLUE="\[\e[34m\]"
TEXT_FORMAT_FOREGROUND_MAGENTA="\[\e[35m\]"
TEXT_FORMAT_FOREGROUND_CYAN="\[\e[36m\]"
TEXT_FORMAT_FOREGROUND_LIGHT_GRAY="\[\e[37m\]"
TEXT_FORMAT_FOREGROUND_DARK_GRAY="\[\e[90m\]"
TEXT_FORMAT_FOREGROUND_LIGHT_RED="\[\e[91m\]"
TEXT_FORMAT_FOREGROUND_LIGHT_GREEN="\[\e[92m\]"
TEXT_FORMAT_FOREGROUND_LIGHT_YELLOW="\[\e[93m\]"
TEXT_FORMAT_FOREGROUND_LIGHT_BLUE="\[\e[94m\]"
TEXT_FORMAT_FOREGROUND_LIGHT_MAGENTA="\[\e[95m\]"
TEXT_FORMAT_FOREGROUND_LIGHT_CYAN="\[\e[96m\]"
TEXT_FORMAT_FOREGROUND_WHITE="\[\e[97m\]"


TEXT_FORMAT_BACKGROUND_BLACK="\[\e[40m\]"
TEXT_FORMAT_BACKGROUND_RED="\[\e[41m\]"
TEXT_FORMAT_BACKGROUND_GREEN="\[\e[42m\]"
TEXT_FORMAT_BACKGROUND_YELLOW="\[\e[43m\]"
TEXT_FORMAT_BACKGROUND_BLUE="\[\e[44m\]"
TEXT_FORMAT_BACKGROUND_MAGENTA="\[\e[45m\]"
TEXT_FORMAT_BACKGROUND_CYAN="\[\e[46m\]"
TEXT_FORMAT_BACKGROUND_LIGHT_GRAY="\[\e[47m\]"
TEXT_FORMAT_BACKGROUND_DARK_GRAY="\[\e[100m\]"
TEXT_FORMAT_BACKGROUND_LIGHT_RED="\[\e[101m\]"
TEXT_FORMAT_BACKGROUND_LIGHT_GREEN="\[\e[102m\]"
TEXT_FORMAT_BACKGROUND_LIGHT_YELLOW="\[\e[103m\]"
TEXT_FORMAT_BACKGROUND_LIGHT_BLUE="\[\e[104m\]"
TEXT_FORMAT_BACKGROUND_LIGHT_MAGENTA="\[\e[105m\]"
TEXT_FORMAT_BACKGROUND_LIGHT_CYAN="\[\e[106m\]"
TEXT_FORMAT_BACKGROUND_WHITE="\[\e[107m\]"



# Some programs do not accept escape sequences...
TEXT_FORMAT_NOESC_RESET="\e[0m"


TEXT_FORMAT_NOESC_BOLD="\e[1m"
TEXT_FORMAT_NOESC_DIM="\e[2m"
TEXT_FORMAT_NOESC_UNDERLINE="\e[4m"
TEXT_FORMAT_NOESC_BLINK="\e[5m"
TEXT_FORMAT_NOESC_REVERSE="\e[7m"
TEXT_FORMAT_NOESC_HIDDEN="\e[8m"


TEXT_FORMAT_NOESC_DEFAULT="\e[39m"


TEXT_FORMAT_NOESC_FOREGROUND_BLACK="\e[30m"
TEXT_FORMAT_NOESC_FOREGROUND_RED="\e[31m"
TEXT_FORMAT_NOESC_FOREGROUND_GREEN="\e[32m"
TEXT_FORMAT_NOESC_FOREGROUND_YELLOW="\e[33m"
TEXT_FORMAT_NOESC_FOREGROUND_BLUE="\e[34m"
TEXT_FORMAT_NOESC_FOREGROUND_MAGENTA="\e[35m"
TEXT_FORMAT_NOESC_FOREGROUND_CYAN="\e[36m"
TEXT_FORMAT_NOESC_FOREGROUND_LIGHT_GRAY="\e[37m"
TEXT_FORMAT_NOESC_FOREGROUND_DARK_GRAY="\e[90m"
TEXT_FORMAT_NOESC_FOREGROUND_LIGHT_RED="\e[91m"
TEXT_FORMAT_NOESC_FOREGROUND_LIGHT_GREEN="\e[92m"
TEXT_FORMAT_NOESC_FOREGROUND_LIGHT_YELLOW="\e[93m"
TEXT_FORMAT_NOESC_FOREGROUND_LIGHT_BLUE="\e[94m"
TEXT_FORMAT_NOESC_FOREGROUND_LIGHT_MAGENTA="\e[95m"
TEXT_FORMAT_NOESC_FOREGROUND_LIGHT_CYAN="\e[96m"
TEXT_FORMAT_NOESC_FOREGROUND_WHITE="\e[97m"


TEXT_FORMAT_NOESC_BACKGROUND_BLACK="\e[40m"
TEXT_FORMAT_NOESC_BACKGROUND_RED="\e[41m"
TEXT_FORMAT_NOESC_BACKGROUND_GREEN="\e[42m"
TEXT_FORMAT_NOESC_BACKGROUND_YELLOW="\e[43m"
TEXT_FORMAT_NOESC_BACKGROUND_BLUE="\e[44m"
TEXT_FORMAT_NOESC_BACKGROUND_MAGENTA="\e[45m"
TEXT_FORMAT_NOESC_BACKGROUND_CYAN="\e[46m"
TEXT_FORMAT_NOESC_BACKGROUND_LIGHT_GRAY="\e[47m"
TEXT_FORMAT_NOESC_BACKGROUND_DARK_GRAY="\e[100m"
TEXT_FORMAT_NOESC_BACKGROUND_LIGHT_RED="\e[101m"
TEXT_FORMAT_NOESC_BACKGROUND_LIGHT_GREEN="\e[102m"
TEXT_FORMAT_NOESC_BACKGROUND_LIGHT_YELLOW="\e[103m"
TEXT_FORMAT_NOESC_BACKGROUND_LIGHT_BLUE="\e[104m"
TEXT_FORMAT_NOESC_BACKGROUND_LIGHT_MAGENTA="\e[105m"
TEXT_FORMAT_NOESC_BACKGROUND_LIGHT_CYAN="\e[106m"
TEXT_FORMAT_NOESC_BACKGROUND_WHITE="\e[107m"