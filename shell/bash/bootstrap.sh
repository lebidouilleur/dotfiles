### bootstrap.sh ---                                -*- mode: shell-script;  -*-

## Copyright (C) 2021  lebidoulleur

## Author: lebidoulleur <lebidoulleur@icloud.com>
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

#

### Includes:

source "$SH_DIR/assert.sh"

### Code:





# See: https://unix.stackexchange.com/a/285928
# Check if GNU/Bash version is >= $BASH_MINIMUM_VERSION.
if assert_string_neq "$(printf '%s\n' "$BASH_MINIMUM_VERSION" "$BASH_VERSION" | sort -V | head -n1)" "$BASH_MINIMUM_VERSION"
then
    echo "Your are currently using GNU/Bash ${BASH_VERSION%.*}."
    echo "Unfortunately, this dotfile config requires GNU/Bash $BASH_MINIMUM_VERSION or above."
    echo "Consider to update GNU/Bash before using our dotfiles."
    return 1
fi



# Load all the *.lib.bash files in `lib/` to setup everything that may be needed.
for lib in $(find "$SH_DIR/lib" -type f -name "*.lib.bash")
do
    [[ -f ${lib} ]] && source ${lib}
done



# Check if plugins exist and load them.  Custom plugins should be in `$SH_DIR/custom/plugins/`.
for plugin in ${PLUGINS[*]}
do
    if assert_file_exists $SH_DIR/custom/plugins/${plugin}/${plugin}.plugin.bash
    then
        source $SH_DIR/custom/plugins/${plugin}/${plugin}.plugin.bash
    elif assert_file_exists $SH_DIR/plugins/${plugin}/${plugin}.plugin.bash
    then
        source $SH_DIR/plugins/${plugin}/${plugin}.plugin.bash
    fi
done



# Load all the *.bash configuration file in utils/
for util in $SH_DIR/utils/*.util.bash
do
    if assert_file_exists ${util}
    then
        source ${util}
    fi
done



# Load the theme specified by the user
if assert_string_not_empty $SH_THEME && assert_string_neq $SH_THEME "default"
then
    if assert_eq $SH_THEME "random"
    then
        theme_list=($SH_DIR/themes/*.theme.bash)
        selected_theme=${theme_list[((RANDOM%${#theme_list[@]}))]}
        source $selected_theme
    else
        if assert_file_exists $SH_DIR/custom/themes/$SH_THEME.theme.bash
        then
            source $SH_DIR/custom/themes/$SH_THEME.theme.bash
        elif assert_file_exists $SH_DIR/themes/$SH_THEME.theme.bash
        then
            source $SH_DIR/themes/$SH_THEME.theme.bash
        fi
    fi
fi
