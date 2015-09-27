#!/usr/bin/env bash

# Provisioning of the Vagrant container for Lustrous.

# Update lists of packages.
apt-get update

# Upgrade existing packages.
apt-get upgrade -y

# Install Varnish and its documentation.
apt-get install -y varnish varnish-doc

# Install a light version of nginx with only a minimal set of features.
apt-get install -y nginx-light

# Remove all unused packages.
apt-get autoremove -y

# Stop and disable Varnish logging daemon.
systemctl stop varnishlog.service
systemctl disable varnishlog.service

# Stop and disable Varnish NCSA logging daemon.
systemctl stop varnishncsa.service
systemctl disable varnishncsa.service

# Create a symbolic link to Varnish documentation so that
# it is easily accessible from the host system's Web browser.
ln --verbose --symbolic /usr/share/doc/varnish-doc/html /var/www/html/varnish-doc

# Put the Lustrous' home page in nginx's document root.
cp --verbose /vagrant/index.html /var/www/html/

