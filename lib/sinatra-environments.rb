require 'sinatra/base'
require 'sinatra-environments/version'

module Sinatra
  class Base
    set(:config_directory, "config/environments")
  end

  module Environments
    def config_directory= path
      super
      register Sinatra::Environments
    end

    def self.registered app
      environment_file = File.join(app.config_directory, "../environment.rb")

      if File.exists?(environment_file)
        require File.join(Dir.pwd, environment_file)
      end

      Dir["#{app.config_directory}/**/*.rb"].each do |file_path|
        require File.join(Dir.pwd, file_path)
      end
    end
  end
end

