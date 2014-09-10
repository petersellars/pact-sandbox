require 'rainbow'

task :default => ['packer:validate']

namespace :packer do
  desc 'Validate the Packer template'
  task :validate do
    puts Rainbow("packer validate ubuntu1404-desktop.json").green
    unless system "packer validate ubuntu1404-desktop.json"
      puts Rainbow("ubuntu1404-desktop.json is not a valid packer template").red
      fail "ubuntu1404-desktop.json is not a valid packer template"
    end
  end
end

