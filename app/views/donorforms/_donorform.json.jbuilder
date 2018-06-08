json.extract! donorform, :id, :user_id, :title, :description, :amount, :promises, :approve, :reject, :deadline, :created_at, :updated_at
json.url donorform_url(donorform, format: :json)
