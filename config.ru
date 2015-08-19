# --- Start of unicorn worker killer code ---

if ENV['RAILS_ENV'] == 'production'
  require 'unicorn/worker_killer'

  max_request_min =  500
  max_request_max =  600

  # Max requests per worker
  use Unicorn::WorkerKiller::MaxRequests, max_request_min, max_request_max

  oom_min = (240) * (1024**2)
  oom_max = (260) * (1024**2)

  # Max memory size (RSS) per worker
  use Unicorn::WorkerKiller::Oom, oom_min, oom_max
end

# use Rack::Cors do
#   # allow do
#   #   origins 'localhost:3000', '127.0.0.1:3000',
#   #           /http:\/\/192\.168\.0\.\d{1,3}(:\d+)?/
#   #           # regular expressions can be used here

#   #   resource '/file/list_all/', :headers => 'x-domain-token'
#   #   resource '/file/at/*',
#   #       :methods => [:get, :post, :put, :delete, :options],
#   #       :headers => 'x-domain-token',
#   #       :expose  => ['Some-Custom-Response-Header'],
#   #       :max_age => 600
#   #       # headers to expose
#   # end

#   allow do
#     origins '*'
#     resource '/*', headers: :any, methods: :get
#   end
# end

# --- End of unicorn worker killer code ---

# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)
run Rails.application
