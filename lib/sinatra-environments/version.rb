module Sinatra
  module Environments
    VERSION = "0.0.2" unless const_defined?(:VERSION)

    def self.version
      VERSION
    end
  end
end

