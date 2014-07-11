require "rails-assets-mailcheck/version"


if defined?(Rails)
  module RailsAssetsMailcheck
    class Engine < ::Rails::Engine
      # Rails -> use vendor directory.
    end
  end
end
