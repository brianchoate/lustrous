#!/usr/bin/env bash

# Provisioning of the Vagrant container for Lustrous.

# Update lists of packages.
apt-get update

# Upgrade existing packages.
apt-get upgrade -y

# Install Varnish and its documentation.
apt-get install -y varnish varnish-doc

# Stop and disable Varnish logging daemon.
systemctl stop varnishlog.service
systemctl disable varnishlog.service

# Stop and disable Varnish NCSA logging daemon.
systemctl stop varnishncsa.service
systemctl disable varnishncsa.service

