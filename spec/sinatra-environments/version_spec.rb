require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Sinatra::Environments do
  it 'is the latest version' do
    Sinatra::Environments.version.should == '0.0.1'
  end
end

