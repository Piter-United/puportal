# config valid only for current version of Capistrano
lock "3.4.0"

set :application, "piter-united"

set :repo_url, "git@github.com:Piter-United/puportal.git"
set :scm, :git
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

set :format, :pretty
set :log_level, :debug
set :pty, true

set :rbenv_type, :system
set :rbenv_ruby, File.read(".ruby-version").strip
# set :rbenv_prefix, "RBENV_ROOT=#{ fetch(:rbenv_path) } RBENV_VERSION=#{ fetch(:rbenv_ruby) } #{ fetch(:rbenv_path) }/bin/rbenv exec"
# set :rbenv_map_bins, %w{rake gem bundle ruby rails}
# set :rbenv_roles, :all

set :rbenv_custom_path, "/opt/rbenv"#"/home/deploy/.rbenv/"

set :ssh_options, {
  forward_agent: true,
  # port: 3456
}

set :deploy_to, "/home/deploy/#{ fetch(:application) }"
set :deploy_user, :deploy
set :linked_files, fetch(:linked_files, []).push("config/database.yml", "config/secrets.yml", ".env")
set :linked_dirs,  fetch(:linked_dirs, []).push("tmp/pids", "tmp/sockets", "public/uploads", "log")
set :keep_releases, 5

# set :default_env, { path: "/opt/ruby/bin:$PATH" }

namespace :foreman do
  desc "start server"
  task :start do
    on roles(:all) do
      sudo "start #{ fetch(:application) }"
    end
  end

  desc "stop server"
  task :stop do
    on roles(:all) do
      sudo "stop #{ fetch(:application) }"
    end
  end

  desc "restart server"
  task :restart do
    on roles(:all) do
      sudo "restart #{ fetch(:application) }"
    end
  end

  desc "server status"
  task :status do
    on roles(:all) do
      execute "initctl list | grep #{ fetch(:application) }"
    end
  end

  desc "export init file"
  task :export do
    on roles(:all) do
      foreman_temp = "/tmp/foreman/#{ Time.now.to_i }"
      execute  "mkdir -p #{ foreman_temp }"

      within current_path do
        execute :bundle, "exec foreman export upstart #{ foreman_temp } -a #{ fetch(:application) } -u #{ fetch(:deploy_user) } -l #{ shared_path }/log -d #{ current_path }"
      end

      sudo "mv #{ foreman_temp }/* /etc/init/"
      sudo "rm -r #{ foreman_temp }"
    end
  end
end

namespace :deploy do
  desc "Restart application"
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke "foreman:restart"
    end
  end

  after :published, "foreman:export"

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, "cache:clear"
      # end
    end
  end

  desc "Grand permissions for nginx"
  task :grand_permissions do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      execute "chown deploy:www-data -R #{ current_path }/public"
    end
  end

  after :published, "deploy:grand_permissions"
end
