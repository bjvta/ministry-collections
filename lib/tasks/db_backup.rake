namespace :db do
  desc "Backup the database"
  task backup: :environment do
    db_config = Rails.configuration.database_configuration[Rails.env]
    username = db_config["username"]
    password = db_config["password"]
    database = db_config["database"]
    host = db_config["host"]

    backup_file = "db-backup-#{Time.now.strftime('%Y-%m-%d_%H-%M-%S')}.sql"
    command = "PGPASSWORD='#{password}' pg_dump -h #{host} -U #{username} -d #{database} -F c > #{backup_file}"

    puts "Running: #{command}"
    system(command)
    puts "Backup complete: #{backup_file}"
  end
end