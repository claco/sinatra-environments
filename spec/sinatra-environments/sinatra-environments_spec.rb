require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe Sinatra::Environments do
  class TestSinatraApplication < Sinatra::Base
    register Sinatra::Environments
  end

  describe "using base settings" do
    it "defaults the setting config_directory to config/environments" do
      Sinatra::Base.environments_config_directory.should == "config/environments"
    end
  end

  describe "using an example environment" do
    it "allows you to override config_directory" do
      TestSinatraApplication.environments_config_directory = "spec/config/environments"
      TestSinatraApplication.environments_config_directory.should == "spec/config/environments"
    end

    it "registers an environment for the test sinatra application" do
      TestSinatraApplication.environments_config_directory = "spec/config/environments"
      Test::THAT_ENVIRONMENT_EXISTS.should be_true
      Test::THAT_TEST_ENVIRONMENT_EXISTS.should be_true
    end
  end  
end
