### scm.lib.bash ---                                 -*- mode: shell-script; -*-

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



# A git repository is a git work-tree directory with AT LEAST one commit.
function sh.scm.is_repository {
    if command_exists git
    then
        [[ -n "$(command git rev-parse --is-inside-work-tree 2>/dev/null)" ]] && \
        [[ -n "$(command git rev-parse --short HEAD 2>/dev/null)" ]]
    fi
}


alias gbn=sh.scm.branch_name
function sh.scm.branch_name {
    echo "$(command git rev-parse --abbrev-ref HEAD)"
}


function sh.scm.is_ahead {
    if [[ -n "$(command git rev-list origin/$(gbn)..HEAD 2>/dev/null)" ]]
    then
        echo "$SH_THEME_PROMPT_VCS_AHEAD"
    fi
}


function sh.scm.is_behind {
    if [[ -n "$(command git rev-list HEAD..origin/$(gbn) 2>/dev/null)" ]]
    then
        echo "$SH_THEME_PROMPT_VCS_BEHIND"
    fi
}


function sh.scm.is_dirty {
    local FLAGS='--porcelain '

    if [[ "$ENABLE_UNTRACKED_FILES_AS_DIRTY" != "true" ]]
    then
        FLAGS+='--untracked-files=no'
    fi

    if [[ -n "$(command git status -s ${FLAGS} 2>/dev/null | tail -n1)" ]]
    then
        echo "$SH_THEME_PROMPT_VCS_DIRTY"
    else
        echo "$SH_THEME_PROMPT_VCS_CLEAN"
    fi
}


function sh.scm.long_sha {
    echo $(command git rev-parse HEAD 2>/dev/null)
}


function sh.scm.short_sha {
    echo $(command git rev-parse --short HEAD 2>/dev/null)
}


function sh.scm.delete_last_commit {
    git reset HEAD~
}
