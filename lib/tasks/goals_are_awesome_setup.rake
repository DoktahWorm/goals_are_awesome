namespace :gaa do
  
  def create_database_config
    config_dir = "#{RAILS_ROOT}/config"
    database_config = "#{config_dir}/database.yml"
    if File.exist? database_config
      puts "Database config already exists.  Will not overwrite."
      return
    else
      puts "...Using template to create live database config: #{database_config}"
      system("cp", "#{database_config}.template", database_config)
      puts "...done."
    end    
  end
  
  desc "Setup a new project after cloning from scratch."
  task :setup do
    create_database_config
    puts "Done with setup.  Happy coding!"
  end
end