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
rm --force --verbose /var/www/html/varnish-doc
ln --force --verbose --symbolic /usr/share/doc/varnish-doc/html /var/www/html/varnish-doc

# Put the Lustrous' home page in nginx's document root.
cp --force --verbose /provision/index.html /var/www/html/

# Download the source code of Varnish Debian package and create
# a symbolic link to the source code of varnishtest
# and its regression tests is easily accessible from the host
# system's Web browser.
rm --force --verbose --recursive /usr/src/pkg-varnish
git clone git://anonscm.debian.org/pkg-varnish/pkg-varnish.git /usr/src/pkg-varnish
rm --force --verbose /var/www/html/varnishtest-src
ln --force --verbose --symbolic /usr/src/pkg-varnish/bin/varnishtest /var/www/html/varnishtest-src

# Remove all active nginx configuration, replace it with
# Lustrous-specific settings and restart nginx.
rm --force --verbose /etc/nginx/sites-enabled/*
cp --force --verbose /provision/lustrous.nginx.conf /etc/nginx/sites-available/
ln --force --verbose --symbolic /etc/nginx/sites-available/lustrous.nginx.conf /etc/nginx/sites-enabled/lustrous
service nginx restart

