_root_ = File.expand_path('../../',  __FILE__)

require "the_comments_subscriptions/version"

module TheCommentsSubscriptions
  class Engine < Rails::Engine
    config.autoload_paths << "#{ config.root }/app/mailers/concerns/"
  end
end

# Routing cocerns loading
require "#{ _root_ }/config/routes"
