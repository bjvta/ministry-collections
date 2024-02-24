json.extract! member, :id, :first_name, :last_name, :birthday, :active, :enabled_to_pay, :created_at, :updated_at
json.url member_url(member, format: :json)
