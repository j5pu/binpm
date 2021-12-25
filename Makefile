.PHONY: tests

SHELL := $(shell command -v bash)

color:
	@bin/color lib

tests:
	@bats.sh --tests
