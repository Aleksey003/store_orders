require "rvm/capistrano"
require "bundler/capistrano"

set :application, "bootshop"
set :deploy_to, "/home/app/bootshop"

set :use_sudo, false
set :deploy_via, :remote_cache
set :repository,  "git@github.com:Aleksey003/store_orders.git"
set :branch, "store"
set :rvm_ruby_string, "ruby-1.9.3-p448"
ssh_options[:forward_agent] = true


# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :user, "app"
role :web, "192.81.220.119"                          # Your HTTP server, Apache/etc
role :app, "192.81.220.119"                          # This may be the same as your `Web` server
role :db,  "192.81.220.119", :primary => true # This is where Rails migrations will run

before 'deploy', 'rvm:install_ruby'
after "deploy:restart", "deploy:cleanup"


namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end


# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end