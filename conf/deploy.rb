set :application, "playframework-neo4j-template"
set :repository,  "git@github.com:tomasmuller/playframework-neo4j-template.git"

set :scm, :git

role :web, "codenroll.org"                   # Your HTTP server, Apache/etc
role :app, "codenroll.org"                   # This may be the same as your `Web` server
role :db,  "codenroll.org", :primary => true # This is where Rails migrations will run

set :port, 22777

# The server's user for deploys
set :user, "deployer"
set :use_sudo, false

set :ssh_options, { :forward_agent => true }

set :branch, "master"

set :deploy_via, :remote_cache

set :keep_releases, 5

# the directory where capistrano will setup it's env and clone your VCS and deploy current version etc...
# read this for more info about Capistrano deploy https://github.com/mpasternacki/capistrano-documentation-support-files/raw/master/default-execution-path/Capistrano%20Execution%20Path.jpg
set :deploy_to, "/home/deployer/apps/play/#{application}"

# You can let it like that
set :shared_path, "#{deploy_to}/shared"
set :app_pid, "#{shared_path}/pids/server.pid"
set :app_path, "#{deploy_to}/current"

# https://github.com/capistrano/capistrano/wiki/2.x-DSL-Action-Invocation-Run
default_run_options[:shell] = '/bin/bash --login'

# Hooks
after "deploy", "playframework:setup", "playframework:package"

namespace :playframework do
  task :setup do
    put "#!/bin/bash\nnohup bash -c \"cd #{current_path} && target/start $* &>> #{current_path}/log/#{application}.log 2>&1\" &> /dev/null &", "#{current_path}/start.sh", :mode => '755', :via => :scp
    put "#!/bin/bash\npid=`cat RUNNING_PID 2> /dev/null`\nif [ \"$pid\" == \"\" ]; then echo '#{application} is not running'; exit 0; fi\necho 'Stopping #{application}...'\nkill -SIGTERM $pid", "#{current_path}/stop.sh", :mode => '755', :via => :scp
    put "#!/bin/bash\nexport", "#{current_path}/envvars.sh", :mode => '755', :via => :scp
  end

  task :envvars do
    run [
      "cd #{current_path}",
      "./envvars.sh"
    ].join(" && ")
  end

  task :tests do
    run [
      "cd #{current_path}",
      "play test"
    ].join(" && ")
  end

  task :package do
    run [
      "cd #{current_path}",
      "play clean compile stage"
    ].join(" && ")
  end

  task :stop do
    run [
      "cd #{current_path}",
      "./stop.sh"
    ].join(" && ")
  end

  task :start_prod do
    run [
      "cd #{current_path}",
      "./start.sh -Dconfig.resource=#{prod_conf}"
    ].join(" && ")
  end

  task :start_dev do
    run [
      "cd #{current_path}",
      "./start.sh"
    ].join(" && ")
  end
end