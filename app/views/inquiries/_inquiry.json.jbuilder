json.extract! inquiry, :id, :subject, :message_content, :created_at, :updated_at
json.url inquiry_url(inquiry, format: :json)
