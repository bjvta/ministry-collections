class BackupsController < ApplicationController
  require 'json'
  require 'fileutils'

  def new
  end

  def create
    # Create a temporary directory for the backup
    backup_dir = Rails.root.join('tmp', 'backup')
    FileUtils.mkdir_p(backup_dir)

    # Collect all records from each table and convert them to JSON
    backup_data = {
      members: Member.all.as_json,
      fee_types: FeeType.all.as_json,
      fines: Fine.all.as_json,
      expenses: Expense.all.as_json,
      weekly_collections: WeeklyCollection.all.as_json,
      member_weekly_collections: MemberWeeklyCollection.all.as_json,
      balances: Balance.all.as_json
    }

    # Write the JSON data to a file
    backup_file = backup_dir.join("backup_#{Time.now.strftime('%Y%m%d%H%M%S')}.json")
    File.open(backup_file, 'w') do |file|
      file.write(JSON.pretty_generate(backup_data))
    end

    # Send the file to the user
    send_file backup_file, type: 'application/json', disposition: 'attachment', filename: backup_file.basename.to_s

    # Clean up the temporary backup directory
    # FileUtils.rm_rf(backup_dir)
  end
end
