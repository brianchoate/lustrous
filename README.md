# Lustrous #

**Lustrous is a work in progress at a very early stage of development. Chances are, the documentation is incomplete, inaccurate or simply missing. Please contact [me](https://github.com/michalroszka) directly for any information on the project.**

Lustrous provides a complete and self–contained, isolated, portable and reproducible environment for working with [Varnish](https://www.varnish-cache.org/) configuration. Lustrous stands on the shoulders of giants and is built on top of industry–standard technology. It offers the quickest possible start into the Varnish Configuration Language. With a healthy dose of automation, it makes test–driven Varnish configuration easier than ever.

## Requirements ##

In order to run Lustrous you need a reasonably powerful 64-bit x86 hardware with at least 1GB of RAM and 2GB of free disk space available and an operating system capable of running [VirtualBox](https://www.virtualbox.org/) and [Vagrant](https://www.vagrantup.com/). On Linux, you also need a [Network File System (NFS)](https://en.wikipedia.org/wiki/Network_File_System) server.

**Lustrous has not been tested on a Mac or a Windows PC.**

## Quick Start ##

This section assumes you are using [Debian GNU/Linux](https://www.debian.org/), [Ubuntu](http://www.ubuntu.com/) or another decent Debian–based distribution.

1. Install [Git](http://git-scm.com/):

    ```
    $ sudo apt-get install git
    ```
2. Install the [Network File System (NFS)](https://en.wikipedia.org/wiki/Network_File_System) server:

    ```
    $ sudo apt-get install nfs-kernel-server
    ```
3. Install the latest [VirtualBox](https://www.virtualbox.org/)
4. Install the latest [Vagrant](https://www.vagrantup.com/)
5. Clone the [Lustrous GitHub repository](https://github.com/michalroszka/lustrous) and start up the environment:

    ```
    $ git clone https://github.com/michalroszka/lustrous.git
    $ cd lustrous
    $ vagrant up
    ```
6. Start an interactive shell:

    ```
    $ vagrant ssh
    ```
7. The `/vagrant` folder corresponds to the Lustrous folder on your host machine, and its contents is shared. This allows you to use your normal editor environment on your host machine to edit the code that runs on your virtual machine.

8. Test your code:

    ```
    $ sudo /usr/share/varnish/reload-vcl -c /vagrant/example/example.vcl
    $ varnishtest /vagrant/tests/example.vtc
    ```

## License ##

Lustrous is provided under
the [MIT License](https://opensource.org/licenses/MIT). See accompanying
LICENSE.md for details.

