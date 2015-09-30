#!/usr/bin/env make -f

default: help

help:
	@echo 'Usage:'
	@echo 'make help - Print this help'
	@echo 'make test VCL=dir - Test specified Varnish configuration'

test: DIR := $(shell readlink -m $(CURDIR)/$(VCL))
test: TEST_DIR := $(shell readlink -m $(DIR)/tests)
test: 

	@echo "Expecting Varnish configuration in $(DIR)..."

	@test -d $(DIR) || ( \
	echo "$(DIR): no such directory"; \
	exit 2 )

	@echo "Expecting tests in $(TEST_DIR)..."

	@test -d $(TEST_DIR) || ( \
	echo "$(TEST_DIR): no such directory"; \
	exit 4 )

	@N=0; \
	for VAR in $$( find $(TEST_DIR) -type f -name "*.vtc" ); \
	do \
		varnishtest -D vcl_root=$(DIR) $$VAR || exit $$?; \
		N=$$(expr $$N + 1); \
	done; \
	if [ $$N -eq 0 ]; then \
		echo "no tests found."; \
		exit 5; \
	fi \

.PHONY: help test

