require 'uri'
require 'fileutils'
require 'zip'

class BackupsController < ApplicationController
  def new
  end

  def create
    # Create a temporary directory for the backup
    backup_dir = Rails.root.join('tmp', 'backup')
    FileUtils.mkdir_p(backup_dir)

    # Parse the DATABASE_URL
    db_url = URI.parse(ENV['DATABASE_URL'])
    db_name = db_url.path[1..-1]  # Remove leading slash
    db_user = db_url.user
    db_password = db_url.password
    db_host = db_url.host
    db_port = db_url.port || 5432

    backup_file = backup_dir.join("#{db_name}_backup.sql")

    # Execute the pg_dump command
    `PGPASSWORD=#{db_password} pg_dump -U #{db_user} -h #{db_host} -p #{db_port} #{db_name} > #{backup_file}`

    # Backup files (if you have a directory for user uploads)
    uploads_dir = Rails.root.join('public', 'uploads')
    FileUtils.cp_r(uploads_dir, backup_dir) if Dir.exist?(uploads_dir)

    # Create a zip file of the backup
    zipfile_name = Rails.root.join('tmp', "backup_#{Time.now.strftime('%Y%m%d%H%M%S')}.zip")
    Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
      Dir[File.join(backup_dir, '**', '**')].each do |file|
        zipfile.add(file.sub(backup_dir.to_s + '/', ''), file)
      end
    end

    # Clean up the temporary backup directory
    FileUtils.rm_rf(backup_dir)

    # Send the zip file to the user
    send_file zipfile_name, type: 'application/zip', disposition: 'attachment', filename: zipfile_name.basename.to_s

    # Clean up the zip file after sending
    zipfile_name.unlink
  end
end
