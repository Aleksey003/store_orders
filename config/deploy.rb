set :application, "bootshop"


set :user, "deployer"


set :scm, "git"
set :repository, "git@github.com:Aleksey003/store_orders.git"
set :branch, "bootshop"

set :port, 22
# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`


set :deploy_to, "/home/deployer/apps/#{application}"

set :location, "192.81.220.119"
role :web, location                          # Your HTTP server, Apache/etc
role :app, location                          # This may be the same as your `Web` server
role :db,  location, :primary => true # This is where Rails migrations will run

namespace :deploy do
	%w[start stop restart].each do |command|
		desc "#{command} unicorn server"
		task command, roles: :app, except: {no_release: true} do
		run "/etc/init.d/unicorn_#{application} #{command}"
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