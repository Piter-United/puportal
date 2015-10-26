class NoCompression
  def compress(string)
    # do nothing
    string
  end
end

# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.compress = true
Rails.application.config.assets.js_compressor = NoCompression.new
Rails.application.config.assets.css_compressor = NoCompression.new
# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'bower_components')
Rails.application.config.assets.precompile += %w( views/shared/notification.js )
Rails.application.config.assets.precompile += %w(center.css select2x2.png icomoon.svg icomoon.eot icomoon.woff icomoon.ttf)
Rails.application.config.assets.precompile += %w(.svg .eot .woff .ttf)