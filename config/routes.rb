module TheCommentsSubscriptions
  # TheCommentsSubscriptions::Routes.mixin(self)

  class Routes
    def self.mixin mapper
      mapper.extend ::TheCommentsSubscriptions::DefaultRoutes
      mapper.send :comments_subscriptions_routes
    end
  end

  module DefaultRoutes
    def comments_subscriptions_routes
      get "/unsubscribe_comment/:type/:comment_id/:id"     => "comment_subscriptions#unsubscribe_comment",     as: :unsubscribe_comment
      get "/unsubscribe_commentable/:type/:comment_id/:id" => "comment_subscriptions#unsubscribe_commentable", as: :unsubscribe_commentable
      get "/unsubscribe_all/:type/:id"                     => "comment_subscriptions#unsubscribe_all",         as: :unsubscribe_all
    end
  end
end