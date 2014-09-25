require 'pathname'
require 'rainbow'
require 'rspec/core/rake_task'

task :default => ['packer:clean',
                  'packer:validate']

task :validate => ['packer:clean',
                   'packer:validate',
                   'packer:validate_dev']

BASE_TEMPLATE="ubuntu1404-desktop.json"
DEVELOPMENT_VARS="vars/development.json"
OUTPUT_DIRECTORY="output-packer-ubuntu1404-desktop-amd64"
EXPORTED_BOX="ubuntu-14.04-desktop-amd64.box"

namespace :packer do
  desc 'Validate the base Packer template'
  task :validate do
    puts Rainbow("packer validate #{BASE_TEMPLATE}").green
    unless system "packer validate #{BASE_TEMPLATE}"
      puts Rainbow("#{BASE_TEMPLATE} is not a valid packer template").red
      fail "#{BASE_TEMPLATE} is not a valid packer template"
    end
  end
end

namespace :packer do
  desc 'Validate the development Packer template'
  task  :validate_dev do
    puts Rainbow("packer validate -var-file=#{DEVELOPMENT_VARS} "\
                 "#{BASE_TEMPLATE}").green
    unless system "packer validate -var-file=#{DEVELOPMENT_VARS} "\
                  "#{BASE_TEMPLATE}"
      puts Rainbow("#{BASE_TEMPLATE} using #{DEVELOPMENT_VARS} is not a "\
                   "valid packer template").red
      fail "#{BASE_TEMPLATE} using #{DEVELOPMENT_VARS} is not a valid "\
           "packer template"
    end
  end
end

namespace :packer do
  desc 'Clean the outputs directory'
  task :clean do
    puts Rainbow("rm -rf #{OUTPUT_DIRECTORY}").green
    unless system "rm -rf #{OUTPUT_DIRECTORY}"
      puts Rainbow("Issue cleaning #{OUTPUT_DIRECTORY}").red
      fail "Unable to clean #{OUTPUT_DIRECTORY}"
    end
    puts Rainbow("rm -f #{EXPORTED_BOX}").green
    unless system "rm -f #{EXPORTED_BOX}"
      puts Rainbow("Issue removing #{EXPORTED_BOX}").red
      fail "Unable to clean #{EXPORTED_BOX}"
    end
  end
end

namespace :packer do
  Pathname.glob('*.json').sort.each do |template|
    name = template.basename('.json').to_s
    host = name.gsub(/[.]/, '_')
    desc "Run serverspec to #{host}"
    RSpec::Core::RakeTask.new(:spec) do |task|
      system("vboxmanage showvminfo 'packer-ubuntu1404-desktop-amd64' --machinereadable | grep 'Forwarding' > sedtest")
      system("sed 's/Forwarding(0)=\\\"[^,]*,\\([^,]*\\),\\([^,]*\\),\\([^,]*\\).*/\\3/' <sedtest >sedtest2")
      ssh_forwarded_port = `cat sedtest2`
      `rm sedtest*`
      ENV['SSH_FORWARDED_PORT'] = ssh_forwarded_port
      ENV['HOST'] = host
      task.pattern = "spec/*_spec.rb"
    end
  end
end
