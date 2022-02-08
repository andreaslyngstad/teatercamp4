# config valid for current version and patch releases of Capistrano
lock "~> 3.16.0"

set :application, 'teatercamp'
set :user, 'teatercamp'
set :repo_url, 'git@github.com:andreaslyngstad/Teatercamp4.git'
set :branch, 'main'

set :deploy_via,      :remote_cache
set :deploy_to, "/var/www/vhosts/teatercamp.no/httpdocs/"
set :bundle_path, '/var/www/vhosts/teatercamp.no/httpdocs/gems'
# set :default_env, {
#     path: '/usr/local/rbenv/plugins/ruby-build/bin:/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH',
#     rbenv_root: '/usr/local/rbenv'
# }
set :rbenv_roles, :all
set :rbenv_ruby, '2.7.5'
set :rbenv_ruby_dir, '/home/teatercamp/.rbenv/versions/2.7.5'
set :rbenv_prefix, '/usr/bin/rbenv exec'
# set :rbenv_custom_path, '/usr'

append :linked_files, 'config/database.yml', 'config/email.yml', 'config/master.key'
append :linked_dirs, 'bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/uploads'}
set :assets_dependencies, %w(app/assets lib/assets vendor/assets Gemfile.lock config/routes.rb)
set :keep_releases, 5
set :format, :pretty
set :log_level, :debug
set :pty, true

set :rbenv_type, :user
# set :rbenv_ruby, "2.7.5"


set :rails_assets_groups, :assets
set :assets_roles, [:web, :app]
set :keep_assets, 2


set :puma_threads,    [4, 16]
set :puma_workers,    0

set :pty,             true
set :use_sudo,        false
set :stage,           :production
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.access.log"
set :puma_error_log,  "#{release_path}/log/puma.error.log"
set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true  # Change to false when not using ActiveRecord

append :linked_files, "config/master.key"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "public/uploads"
# namespace :deploy do
#   namespace :assets do
#       task :precompile, :roles => :web do
#         from = source.next_revision(current_revision)
#         if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ lib/assets/ app/assets/ | wc -l").to_i > 0
#           run_locally("rake assets:clean && rake assets:precompile")
#           run_locally "cd public && tar -jcf assets.tar.bz2 assets"
#           top.upload "public/assets.tar.bz2", "#{shared_path}", :via => :scp
#           run "cd #{shared_path} && tar -jxf assets.tar.bz2 && rm assets.tar.bz2"
#           run_locally "rm public/assets.tar.bz2"
#           run_locally("rake assets:clean")
#         else
#           logger.info "Skipping asset precompilation because there were no asset changes"
#         end
#       end
#     end
#   end
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
