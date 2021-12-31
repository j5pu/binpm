.PHONY: color genman tests

SHELL := $(shell command -v bash)

color:
	@bin/color lib

tests: color
	@bats.sh --tests
