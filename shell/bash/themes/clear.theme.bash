### clear.theme.bash ---                             -*- mode: shell-script; -*-

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


BLUE="$TEXT_FORMAT_FOREGROUND_BLUE"
GRAY="$TEXT_FORMAT_FOREGROUND_DARK_GRAY"
RESET="$TEXT_FORMAT_RESET"

BOLD_CYAN="$TEXT_FORMAT_BOLD$TEXT_FORMAT_FOREGROUND_LIGHT_CYAN"
BOLD_MAGENTA="$TEXT_FORMAT_BOLD$TEXT_FORMAT_FOREGROUND_LIGHT_MAGENTA"
BOLD_GREEN="$TEXT_FORMAT_BOLD$TEXT_FORMAT_FOREGROUND_LIGHT_GREEN"
BOLD_RED="$TEXT_FORMAT_BOLD$TEXT_FORMAT_FOREGROUND_LIGHT_RED"



SH_THEME_PROMPT_VCS_DIRTY="*"
SH_THEME_PROMPT_VCS_CLEAN=""
SH_THEME_PROMPT_VCS_AHEAD="$BOLD_CYAN ↑"
SH_THEME_PROMPT_VCS_BEHIND="$BOLD_MAGENTA ↓"

SH_THEME_PROMPT="❯ "


function command_prompt {

    # Store $? result before it get overrided by our functions
    result=$?

    PS1="$BLUE\W "

    if sh.scm.is_repository
    then
        PS1+="$GRAY"
        PS1+="[$(sh.scm.branch_name)$(sh.scm.is_dirty)]"
        PS1+="$(sh.scm.is_ahead)$(sh.scm.is_behind)"
    fi

    PS1+="$RESET\n"

    (( $result == 0 )) && PS1+="$BOLD_GREEN$SH_THEME_PROMPT" \
                       || PS1+="$BOLD_RED$SH_THEME_PROMPT"
    PS1+="$RESET"

}


sh.cli.themes.safe_append_prompt_command command_prompt
