json.extract! event, :id, :user_id, :clockin_time, :clockout_time, :created_at, :updated_at
json.url event_url(event, format: :json)
