require "sinatra/base"
require "sinatra-environments/version"

module Sinatra
  class Base
    set(:environments_config_directory, "config/environments")
  end

  module Environments
    def environments_config_directory=(path)
      super
      register Sinatra::Environments
    end

    def self.registered(app)
      environment = app.settings.environment.to_s
      config_dir = app.environments_config_directory
      parent_dir = File.expand_path(File.join(config_dir, "../"))
      environment_file = File.join(parent_dir, "environment.rb")
      specific_file = File.expand_path(File.join(config_dir, "#{environment}.rb"))

      if File.exists?(environment_file)
        require environment_file
      end

      if File.exists?(specific_file)
        require specific_file
      end
    end
  end
end
