require 'serverspec'
require 'pathname'
require 'net/ssh'

ssh_forwarded_port = ENV['SSH_FORWARDED_PORT'].to_i

set :backend, :ssh
set :host, '127.0.0.1'
set :ssh_options, :user => 'vagrant', :password => 'vagrant', :port=> ssh_forwarded_port 
