#!/usr/bin/env bash

# Provisioning of the Vagrant container for Lustrous.

# Update lists of packages.
apt-get update

# Install Varnish and its documentation.
apt-get install -y varnish varnish-doc
