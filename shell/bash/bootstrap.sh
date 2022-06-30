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

#  This project has as goal to be the lightest shell based on GNU/bash.
#  For that purpose, we externalize as many as possible scripts and
#  plugins as independant pieces of softwares
#  (may they be dash/python/ruby/etc scripts or compiled softwares).

### Includes:

source "$SH_DIR/μlib/μassert.sh"
source "$SH_DIR/μlib/μcolors.sh"
source "$SH_DIR/μlib/μdevtools.sh"

### Code:



# HACK: https://unix.stackexchange.com/a/285928
# Check if GNU/Bash version is >= $BASH_MINIMUM_VERSION.
if assert_string_neq "$(printf '%s\n' "${BASH_MINIMUM_VERSION}" "${BASH_VERSION}" | sort -V | head -n1)" "${BASH_MINIMUM_VERSION}"
then
    echo "Your are currently using GNU/Bash ${BASH_VERSION%.*}."
    echo "Unfortunately, this dotfile configuration requires GNU/Bash $BASH_MINIMUM_VERSION or above."
    echo "Consider to update GNU/Bash before using this configuration."
    return 1
fi



# Load all the *.lib.bash files in `lib/` to setup everything that may be needed.
for lib in $(find "${SH_DIR}/lib" -type f -name "*.lib.bash")
do
    if assert_file_exists ${lib}
    then
        source ${lib}
    fi
done


# Check if plugins exist and load them.
for plugin in ${SH_PLUGINS[*]}
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



# Use `starship` as default shell prompt when installed.
# When `starship` is not installed, use the ultra-simple `clear` theme.
if command_exists starship
then
    eval "$(starship init bash)"
else
    source $SH_DIR/theme/clear.theme.bash
fi
