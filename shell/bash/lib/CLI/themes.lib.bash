### themes.lib.bash ---                              -*- mode: shell-script; -*-

## Copyright (C) 2020  lebidouilleur

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



# https://github.com/Bash-it/bash-it/blob/master/themes/base.theme.bash
function sh.cli.themes.safe_append_prompt_command {
    local prompt_re

    # Set OS dependent exact match regular expression.
    case "${OSTYPE}" in
        darwin*) prompt_re="[[:<:]]${1}[[:>:]]" ;; # macOS
        *)       prompt_re="\<${1}\>"           ;; # Linux/FreeBSD/...
    esac

    if [[ ${PROMPT_COMMAND} =~ ${prompt_re} ]]
    then
      return
    elif [[ -z ${PROMPT_COMMAND} ]]
    then
      PROMPT_COMMAND="${1}"
    else
      PROMPT_COMMAND="${1};${PROMPT_COMMAND}"
    fi
}
