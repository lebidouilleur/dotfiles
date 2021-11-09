### dev.plugin.bash ---                              -*- mode: shell-script; -*-

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




# Add linked directory for personnal projects to PATH
export PATH="${HOME}/.bin/local/:$PATH"



# Add Bash configuration for each languages plugins are available
source $SHDIR/plugins/dev/cc.plugin.bash
source $SHDIR/plugins/dev/java.plugin.bash
source $SHDIR/plugins/dev/ruby.plugin.bash
source $SHDIR/plugins/dev/swift.plugin.bash


# Get a word in a list to generate a random project name.
function progen {
    local word_list=$SH_DIR/plugins/dev/project_words_list.txt
    local lines=$(wc -l < $word_list)
    local random=$(perl -e 'print int(rand(2**32-1))')

    sed -n $((random % lines))p $word_list
}
