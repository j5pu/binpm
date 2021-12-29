.PHONY: color genman tests

SHELL := $(shell command -v bash)

color:
	@bin/color lib

true:
	@true

genman:
	@genman

tests:
	@bats.sh --tests
