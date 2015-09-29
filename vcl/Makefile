#!/usr/bin/env make -f

default: test

help:
	@echo	'Possible targets:'
	@echo	'  help - Print this help'
	@echo	'  test - Run tests (Varnish test cases)'

test:
	@echo	'Running tests (Varnish test cases).'
	@find $(CURDIR)/$(PREFIX)/tests \
		-type f \
		-name "*.vtc" \
		-print0 \
		| xargs -0 \
		varnishtest -D vcl_root=$(CURDIR)/$(PREFIX) \

.PHONY: help test

