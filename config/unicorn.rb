worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
timeout 15
preload_app true

listen File.expand_path("#{ File.dirname(__FILE__) }/../tmp/sockets/unicorn.sock")

stderr_path File.expand_path("#{ File.dirname(__FILE__) }/../log/unicorn.stderr.log")
stdout_path File.expand_path("#{ File.dirname(__FILE__) }/../log/unicorn.stdout.log")

GC.copy_on_write_friendly = true if GC.respond_to?(:copy_on_write_friendly=)

before_fork do |server, worker|
  # Disconnect since the database connection will not carry over
  if defined? ActiveRecord::Base
    ActiveRecord::Base.connection.disconnect!
  end
end

after_fork do |server, worker|
  # Start up the database connection again in the worker
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
  end
end