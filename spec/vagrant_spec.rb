require 'spec_helper'

describe user('vagrant') do
  it { should exist }
  it { should belong_to_group 'vagrant' }
  it { should have_home_directory '/home/vagrant' }
end
