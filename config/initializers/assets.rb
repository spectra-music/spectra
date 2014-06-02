Rails.application.assets.register_engine('.slim', Slim::Template)

# config/initializers/asset_helpers.rb
Rails.application.assets.context_class.class_eval do
  include ActionView::Helpers
  include Rails.application.routes.url_helpers
end