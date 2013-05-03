require 'erb'

after "deploy", "deploy:restart_daemons"

namespace :deploy do
  task :restart, :roles => :web do
    puts "Restarting application #{current_path}"
    run [
      "cd #{current_path}",
      "play clean compile stage",
      "target/start"
    ].join(" && ")
  end

  task :restart_daemons, :roles => :app do
    puts "restarting application deamons"
  end
end

