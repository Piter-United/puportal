Jader.configure do |config|
  config.mixins_path = Rails.root.join('app','assets','javascripts','mixins')
  # make your client-side views directory discoverable to Rails
  config.views_path = Rails.root.join('app','assets','javascripts','templates')
  # Use some javascript from a file that's not available in the asset pipeline
  # config.includes << IO.read(Rails.root.join('app','assets','javascripts','includes','util.js'))
  # In Rails 3 applications, prepend views_path using a controller before filter.
  # This is set to false by default
  config.prepend_view_path = true
  # wait for assets to be ready
  Rails.application.config.after_initialize do
    # include javascripts available only from asset pipeline
    # config.includes << Rails.application.assets['util'].source
  end
end