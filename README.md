# Pact Sandbox

[![Build Status](https://travis-ci.org/petersellars/pact-sandbox.svg?branch=master)](https://travis-ci.org/petersellars/pact-sandbox)

## Packer - Ubuntu 14.04 Desktop Build

Builds a Vagrant Ubuntu 14.04 Desktop base box provisioned for VirtualBox

Uses the [packer-provisioner-host-command](https://github.com/shaunduncan/packer-provisioner-host-command) to run [serverspec](http://serverspec.org/) against the Packer built machine.The [packer-provisioner-host-command](https://github.com/shaunduncan/packer-provisioner-host-command) needs to be built and copied into your [Packer](http://www.packer.io) installation directory.

### ISO Files

For development purposes a local ISO file is used and placed in the ```iso``` directory. This has not been committed to source control. Refer to the ```development.json``` variable file for an example of how to use ISO files from this directory.
