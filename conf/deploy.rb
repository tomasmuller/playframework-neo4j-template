set :application, "playframework-neo4j-template"
set :repository,  "git@github.com:tomasmuller/playframework-neo4j-template.git"

set :scm, :git

role :web, "codenroll.org"                   # Your HTTP server, Apache/etc
role :app, "codenroll.org"                   # This may be the same as your `Web` server
role :db,  "codenroll.org", :primary => true # This is where Rails migrations will run

# Must be set for the password prompt from git to work
default_run_options[:pty] = true

# https://github.com/capistrano/capistrano/wiki/2.x-DSL-Action-Invocation-Run
default_run_options[:shell] = '/bin/bash --login'
# set :default_shell, "/bin/bash"
# set :shell, "/bin/bash"

# The server's domain and user for deploys
set :domain, "codenroll.org"
set :port, 22777
set :user, "deployer"
set :use_sudo, false

# The deploy user's password
# set :scm_passphrase, "<user_pwd>"

set :ssh_options, { :forward_agent => true }

set :branch, "master"

set :deploy_via, :remote_cache

set :keep_releases, 10

# the directory where capistrano will setup it's env and clone your VCS and deploy current version etc...
# read this for more info about Capistrano deploy https://github.com/mpasternacki/capistrano-documentation-support-files/raw/master/default-execution-path/Capistrano%20Execution%20Path.jpg
set :deploy_to, "/home/deployer/apps/play/#{application}"

# You can let it like that
set :shared_path, "#{deploy_to}/shared"
set :app_pid, "#{shared_path}/pids/server.pid"
set :app_path, "#{deploy_to}/current"
