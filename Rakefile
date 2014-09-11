require 'rainbow'

task :default => ['packer:validate']

task :validate => ['packer:validate',
                   'packer:validate_dev']

BASE_TEMPLATE="ubuntu1404-desktop.json"
DEVELOPMENT_VARS="vars/development.json"

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
