### tex.plugin.bash ---                                       -*- mode: bash; -*-

## Copyright (C) 2022  lebidouilleur

## Author: lebidouilleur <lebidouilleur@icloud.com>
## Keywords:

### Commentary:

##

### Code:



CONTEXT_INSTALL_DIR="${HOME}/.local/bin/context"



# Add ConTEXt to $PATH
if assert_directory_exists $CONTEXT_INSTALL_DIR
then
    export PATH="$CONTEXT_INSTALL_DIR/tex/texmf-osx-64/bin:${PATH}"

    # Add system fonts
    export OSFONTDIR="/Library/Fonts:/System/Library/Fonts"
    # Add user fonts
    export OSFONTDIR="${HOME}/Library/Fonts:${OSFONTDIR}"
    # Add ConTEXt fonts
    export OSFONTDIR="$CONTEXT_INSTALL_DIR/tex/texmf-fonts:${OSFONTDIR}"
fi
