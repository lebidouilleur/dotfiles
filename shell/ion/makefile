### makefile ---                                   -*- mode: makefile-gmake; -*-

## Copyright (C) 2021  lebidouilleur

## Author: lebidouilleur <lebidouilleur@icloud.com>
## Keywords:

### Commentary:

#

### Code:




# See: https://stackoverflow.com/a/18137056
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(patsubst %/,%,$(dir $(mkfile_path)))


.PHONY: install
install:
	@echo "Installing ION dotfiles..."
	@cp template/ionrc ${HOME}/.config/ion/initrc
	@sed -i '' -e "s/{{ISH}}/$(subst /,\/,$(current_dir))/g" "${HOME}/.config/ion/initrc"
	@sed -i '' -e "s/{{UNAMEM}}/$(shell uname -m)/g" "${HOME}/.config/ion/initrc"
	@sed -i '' -e "s/{{UNAMES}}/$(shell uname -s)/g" "${HOME}/.config/ion/initrc"
	@echo "Installtion finished!"
