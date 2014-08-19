# PureScript Vagrant

*A Vagrant project which will provision a virtual machine with a complete PureScript development environment.*

## Introduction

This project can be used to download, provision, and run a Linux virtual machine
configured with a complete PureScript development environment. With it you can
begin experimenting with the PureScript programming language without installing
the development dependencies onto your computer. It has three dependencies:

* VirtualBox (or another supported virtualization provider)
* Vagrant
* An SSH client

This project can be used on Windows, Mac OS X, and Linux computers.

### What Is PureScript?

The [PureScript Community Blog](http://www.purescript.org/) describes the PureScript
programming language as

> ...a small strongly, statically typed programming language with expressive types, written in and inspired by Haskell, and compiling to Javascript.

PureScript can be used as a replacement for JavaScript in any context where JavaScript
runs. This includes client-side applications running within the browser, server-side
applications running under [Node.js](http://nodejs.org/), or just about anywhere else.
For more information about PureScript, please visit the community
[homepage](http://www.purescript.org/).

### What Is VitualBox?

[VirtualBox](https://www.virtualbox.org/) is free open source virtual machine software
developed and maintained by Oracle. It allows users to run "virtual" computers within
their own computers. The virtual machine can run a completely different operating
system, can have installed completely different software, and can even mimic completely
different hardware. With this project you can use VirtualBox to run a Linux virtual
machine (called the "guest") as though it were any other application running on your
computer, without affecting your current operating system (called the "host").

We prefer VirtualBox because it is free, open source, and supports many host operating
systems including Windows, Linux, Mac OS X, and Solaris.

### What Is Vagrant?

[Vagrant](https://www.vagrantup.com/) is a tool for automating the creation and configuration
of virtual machines. It is free, open source software. This project contains a set of
Vagrant scripts that, when run, will create a Linux virtual machine that is configured
with a complete PureScript development environment.

## Setup

Before this project can be used to provision the PureScript virtual machine, a few
prerequisites must be installed onto the host computer. Once the prerequisites have
been installed, the virtual machine must be downloaded and configured. This is a
one-time process. Finally, each time the virtual machine is to be used for
PureScript development the virtual machine must be stared and an SSH connection
must be established.

### Install the Prerequisites

* Download and install the version of [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
  appropriate for your computer (the "host"). Installation instructions can be found on
  the VirtualBox [web site](https://www.virtualbox.org/manual/UserManual.html).
* Download and install [Vagrant](https://www.vagrantup.com/downloads.html). Installation
  instructions can be found on the Vagrant [web site](https://docs.vagrantup.com/v2/installation/index.html).
* Install an [SSH](http://en.wikipedia.org/wiki/Secure_Shell) client. If you are
  a Mac or Linux user you already have an SSH client--one is bundled with your
  operating system. For Windows users we recommend installing the command line client
  for the [Git](http://msysgit.github.io/) source control tool. The Git BASH tool
  includes an excellent SSH client. This project was tested on Windows 7 Professional
  using Git BASH.

### Create the Virtual Machine

Creating, provisioning, and configuring a new virtual machine using Vagrant is a fairly
simple process. The entire process is automated and can be accomplished by running one
command from the command line. This process only has to be done one time. Once the
virtual machine is fully configured it never has to be setup again.

Downloading the virtual machine image (called the "box" file) and all the required software
may take some time, however, depending on the speed of your internet connection. On a fast,
modern internet connection the total download time may be nearly 10 minutes. During this
time the process cannot be stopped without corrupting the virtual machine (don't worry--your
computer will be fine). Please make sure you allocate enough time for the process to complete.

#### Instructions

First, clone this repository to your computer. We assume that since you are here you are
familiar with [Git](http://git-scm.com/) and [GitHub](https://github.com/). If not,
GitHub has excellent [help pages](https://help.github.com).

Next, open your terminal/console application and change to the directory where you cloned
this repository using the `cd` command. From the console run the Vagrant command to
provision the virtual machine:

```
$ vagrant up
```

The first time this command is run the virtual machine image and all the required
software will be downloaded and configured. Depending on the speed of your internet
connection this could take 10 minutes or more. During this process a bunch of
messages (that only a DevOps pro could love) will be output to the console. You will
know the process is complete when the output stops. The last few lines of output
should look something similar (though probably not exactly) like this:

```
==> purescript: Installed purescript-0.5.4.1
==> purescript: Running provisioner: file...
==> purescript: Running provisioner: shell...
    purescript: Running: inline script
==> purescript: stdin: is not a tty
==> purescript: Running provisioner: file...
==> purescript: Running provisioner: shell...
    purescript: Running: inline script
==> purescript: stdin: is not a tty
```

At this point the virtual machine will be fully configured and will be running in the
background. To stop the virtual maching use the "halt" command:

```
$ vagrant halt
```

The output should be something like this:

```
==> purescript: Attempting graceful shutdown of VM...
```

And that's it! You will now have a complete a fully-configured PureScript development environment.

## Running the VM to Write Code

Once you have setup the virtual machine you can run it at any time and use it to develop
PureScript applications. The virtual machine has been configured with everything you need
including the [Haskell](http://www.haskell.org/haskellwiki/Haskell) programming language
(necessary for installing and updating the PureScript development tools), all the modern
JavaScript development tools (including [Node.js](http://nodejs.org/), [Bower](http://bower.io/),
and [Grunt](http://gruntjs.com/)), several popular programmer's text editors (including
[Vim](http://www.vim.org/) and [Emacs](http://www.gnu.org/software/emacs/)), [Git](http://git-scm.com/),
and [PureScript](http://www.purescript.org/) itself.

To start the virtual machine, open your terminal/console application and change to the
directory where you cloned. From the console run the Vagrant command as before:

```
$ vagrant up
```

The output should look something like this:

```
Bringing machine 'purescript' up with 'virtualbox' provider...
==> purescript: Checking if box 'ubuntu/trusty64' is up to date...
==> purescript: Clearing any previously set forwarded ports...
==> purescript: Clearing any previously set network interfaces...
==> purescript: Preparing network interfaces based on configuration...
    purescript: Adapter 1: nat
==> purescript: Forwarding ports...
    purescript: 22 => 2222 (adapter 1)
==> purescript: Running 'pre-boot' VM customizations...
==> purescript: Booting VM...
==> purescript: Waiting for machine to boot. This may take a few minutes...
    purescript: SSH address: 127.0.0.1:2222
    purescript: SSH username: vagrant
    purescript: SSH auth method: private key
    purescript: Warning: Connection timeout. Retrying...
    purescript: Warning: Remote connection disconnect. Retrying...
==> purescript: Machine booted and ready!
==> purescript: Checking for guest additions in VM...
==> purescript: Mounting shared folders...
    purescript: /vagrant => /Users/Jerry/Projects/FOSS/purescript-vagrant
==> purescript: Machine already provisioned. Run `vagrant provision` or use the `--provision`
==> purescript: to force provisioning. Provisioners marked to run always will still run.
```

To access the virtual machine, use the Vagrant "ssh" command:

```
$ vagrant ssh
```

This should log you into the virtual machine as the Vagrant user and take you to a
command prompt within the virtual machine:

```
vagrant@vagrant-ubuntu-trusty-64:~$
```

To help you get started we've provided you with the canonical "Hello World!" program.
It is available to you both on the virtual machine and within this project. At the
virtual machine console, change to the project directory:

```
vagrant@vagrant-ubuntu-trusty-64:~$ cd /vagrant/projects/hello/
```

Then verify that everything is working properly by running the `npm install`, `bower install`,
and `grunt`commands. Finally, run the `grunt run` command to run "Hello World!":

```
vagrant@vagrant-ubuntu-trusty-64:/vagrant/projects/hello$ grunt run
Running "execute:main" (execute) task
-> executing /vagrant/projects/hello/dist/Main.js
Hello, World!
-> completed /vagrant/projects/hello/dist/Main.js (143ms)

>> 1 file and 0 calls executed (147ms)

Done, without errors.
```

And that's all there is! You now have a complete PureScript development environment at
your disposal.

When you are done, quit the SSH session to the virtual machine with the `exit` command:

```
vagrant@vagrant-ubuntu-trusty-64:/vagrant/projects/hello$ exit
logout
Connection to 127.0.0.1 closed.
```

Then stop the virtual machine as before with the `vagrant halt` command.

## License and Copyright

This project is free software released under the [MIT License](http://www.opensource.org/licenses/MIT).
