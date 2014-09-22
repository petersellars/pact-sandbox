require 'serverspec'
require 'pathname'
require 'net/ssh'

set :backend, :ssh
set :host, '127.0.0.1'
set :ssh_options, :user => 'vagrant', port=> ENV['SSH_PORT'] 
