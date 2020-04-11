
require 'bundler/capistrano'
require 'capistrano-unicorn'
require 'capistrano/sidekiq'

load 'config/deploy/symlinks'

role :app, '51.75.200.205'
role :web, '51.75.200.205'
role :db,  '51.75.200.205', :primary => true

set :application, 'iblw'
set :rails_env, 'production'
set :database, 'iblw_production'
set :branch, 'master'
set :all_symlinks, {
  'config/database.yml' => 'config/database.yml',
  'config/master.key' => 'config/master.key',
  'config/sidekiq.yml' => 'config/sidekiq.yml',
  'config/unicorn.rb' => 'config/unicorn.rb',
  'config/settings.local.yml' => 'config/settings.local.yml',
  'exports' => 'exports',
}
set :default_shell, '/bin/bash -l'
set :user, 'deploy'
set :port, 4321
set :runner, 'deploy'
set :deploy_to, "/home/#{user}/apps/#{application}"
set :scm, 'git'
set :use_sudo, false
set :deploy_via, :remote_cache
set :repository, 'git@github.com:kocasp/iblw.git'
set :repository_cache, 'git_cache'
set :ssh_options, { :forward_agent => true }

set :unicorn_pid, '/home/deploy/apps/iblw/shared/pids/unicorn.pid'
set :sidekiq_config, '/home/deploy/apps/iblw/shared/config/sidekiq.yml'

default_run_options[:pty] = true
# before 'deploy:update_code', 'thinking_sphinx:stop'
# after  'deploy:update_code', 'thinking_sphinx:index'
# after  'deploy:update_code', 'thinking_sphinx:start'
after  'deploy:restart', 'unicorn:restart'

load 'deploy/assets'
