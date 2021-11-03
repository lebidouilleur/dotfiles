### mpp.theme.bash ---                               -*- mode: shell-script; -*-

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



BOLD_RED="$TEXT_FORMAT_BOLD$TEXT_FORMAT_FOREGROUND_RED"
BOLD_BLUE="$TEXT_FORMAT_BOLD$TEXT_FORMAT_FOREGROUND_LIGHT_BLUE"
BOLD_GREEN="$TEXT_FORMAT_BOLD$TEXT_FORMAT_FOREGROUND_LIGHT_GREEN"
BOLD_YELLOW="$TEXT_FORMAT_BOLD$TEXT_FORMAT_FOREGROUND_LIGHT_YELLOW"
RESET="$TEXT_FORMAT_RESET"



SH_THEME_PROMPT_VCS_DIRTY="$BOLD_RED(x)"
SH_THEME_PROMPT_VCS_CLEAN=""
SH_THEME_PROMPT_VCS_AHEAD="$BOLD_RED(↑)"
SH_THEME_PROMPT_VCS_BEHIND="$BOLD_RED(↓)"



function command_prompt {

    # User and Host
    PS1="$BOLD_BLUE\u"
    PS1+="$RESET@"
    PS1+="$BOLD_GREEN\h"
    PS1+="$RESET:"
    PS1+="$BOLD_YELLOW\W "

    # Git
    if sh.scm.is_repository
    then
        PS1+="$(sh.scm.is_dirty)"
        PS1+="$(sh.scm.is_ahead)"
        PS1+="$(sh.scm.is_behind)\n"
        PS1+="$BOLD_GREEN$(sh.scm.branch_name)"

        PS1+="$RESET:"

        PS1+="$BOLD_RED$(sh.scm.short_sha) "
    fi

    # Simple user or root ?
    PS1+="$RESET\\$ "
}


sh.cli.themes.safe_append_prompt_command command_prompt
