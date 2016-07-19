# Be sure to restart your server when you modify this file.

# TODO: Make sure this is still valid for Rails 5
# Generate digests for assets URLs.
Rails.application.config.assets.digest = true

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.configure do |env|
  env.register_engine('.slim', Slim::Template)
end
