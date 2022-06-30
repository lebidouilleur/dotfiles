### swift.plugin.bash ---                             -*- mode: shell-script; -*-

## copyright (c) 2021  lebidouilleur

## author: lebidouilleur <lebidouilleur@icloud.com>
## keywords:

## this program is free software; you can redistribute it and/or modify
## it under the terms of the gnu general public license as published by
## the free software foundation, either version 3 of the license, or
## (at your option) any later version.

## this program is distributed in the hope that it will be useful,
## but without any warranty; without even the implied warranty of
## merchantability or fitness for a particular purpose.  see the
## gnu general public license for more details.

## you should have received a copy of the gnu general public license
## along with this program.  if not, see <http://www.gnu.org/licenses/>.

### commentary:

##

### code:




# Generate a new swift application/library from Swift Package Manager
function sgen() {
    if assert_string_eq "$1" "app"
    then
        echo "Generate new swift application $2..."

        mkdir "$2"
        cd "$2"
        swift package init --type executable >/dev/null 2>&1
        swift package generate-xcodeproj >/dev/null 2>&1

        cp "${SH_DIR}/plugins/dev/swift.Makefile" "./makefile"
        gsed --in-place "s/APPNAME/${2}/g" "makefile"

        echo "Generate new swift application $2..."
    elif [[ "$1" == "lib" ]]
    then
        echo "Generating new swift library $2..."

        mkdir "$2"
        cd "$2"
        swift package init --type library >/dev/null 2>&1
        swift package generate-xcodeproj >/dev/null 2>&1

        echo "Generating new swift library $2..."
    else
        echo "Usage: swiftgen [app|lib|xcode] [name]..."
        echo "      Note: xcode option generate an xcodeproj of the current project directory"
    fi
}
