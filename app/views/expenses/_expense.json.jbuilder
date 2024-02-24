json.extract! expense, :id, :member_id, :description, :amount, :created_at, :updated_at
json.url expense_url(expense, format: :json)
