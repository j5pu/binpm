.PHONY: color genman tests

SHELL := $(shell command -v bash)

color:
	@bin/color lib

genman:
	@genman

tests:
	@bats.sh --tests
