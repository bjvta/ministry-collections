json.extract! member_weekly_collection, :id, :member_id, :weekly_collection_id, :status, :amount, :paid_date, :created_at, :updated_at
json.url member_weekly_collection_url(member_weekly_collection, format: :json)
