# config valid only for current version of Capistrano
# lock '3.4.0'

set :application, 'marshwoodmusicevents'
set :repo_url, 'git@github.com:sjdaniels/marshwoodmusicevents.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/deploy/marshwoodmusicevents'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('.env')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')
# set :linked_dirs, fetch(:linked_dirs, []).push('logs')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  task :after_deploy do
    on roles(:app) do
      # copy commons into webroot
      # execute "rsync -a /home/deploy/braunsmedia.cbcommons/current/ #{release_path}/commons/"
      # copy webroot to production folder (avoid symlink problem in Tomcat)
      # execute "rsync -a #{release_path}/ #{deploy_to}/production/"
      # execute "touch #{deploy_to}/production/config/_deploy.tag"
  	end
  end

  # task :box_install do
  #   on roles(:app) do
  #     execute "cd '#{release_path}'; box install"
  # 	end
  # end

end

# after "deploy:finishing","deploy:after_deploy"
# before "deploy:check:linked_files", "config:push"