namespace :db do
  desc "Import data from JSON backup"
  task import_json: :environment do
    require 'json'
    file_path = Rails.root.join('app', 'assets', 'files', 'backup_20240516212336.json')

    unless File.exist?(file_path)
      puts "File not found: #{file_path}"
      exit
    end

    # Read the JSON file
    json_data = JSON.parse(File.read(file_path))

    # models_to_disable_callbacks = [Member, FeeType, Fine, Expense, WeeklyCollection, MemberWeeklyCollection, Balance]
    # models_to_disable_callbacks.each { |model| model.skip_callback(:create) }
    # Disable foreign key checks (PostgreSQL specific)
    ActiveRecord::Base.connection.execute("SET session_replication_role = 'replica'")

    begin
      # Import each table's data
      json_data['members'].each do |member_data|
        Member.create!(member_data)
      end

      json_data['fee_types'].each do |fee_type_data|
        FeeType.create!(fee_type_data)
      end

      json_data['fines'].each do |fine_data|
        Fine.create!(fine_data)
      end

      json_data['expenses'].each do |expense_data|
        Expense.create!(expense_data)
      end

      json_data['weekly_collections'].each do |weekly_collection_data|
        WeeklyCollection.create!(weekly_collection_data)
      end
      
      debugger
      json_data['member_weekly_collections'].sort_by! { |hash| hash["id"] }.each do |member_weekly_collection_data|
        MemberWeeklyCollection.create!(member_weekly_collection_data)
      end

      json_data['balances'].sort_by! { |hash| hash["id"] }.each do |balance_data|
        Balance.create!(balance_data)
      end

      puts "Data import completed successfully!"
    rescue => e
      puts "Error occurred: #{e.message}"
      puts e.backtrace.join("\n")
    ensure
      # Re-enable foreign key checks
      ActiveRecord::Base.connection.execute("SET session_replication_role = 'origin'")
    end
  end
end