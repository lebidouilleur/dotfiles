### Makefile ---                                   -*- mode: makefile-gmake; -*-

mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(patsubst %/,%,$(dir $(mkfile_path)))


.PHONY: build
build:
	swift build -c release

install: build
	ln -s $(current_dir)/.build/release/APPNAME ${HOME}/.bin/local/APPNAME

run:
	swift run
