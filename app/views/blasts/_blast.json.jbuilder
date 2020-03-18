json.extract! blast, :id, :message_id, :recipients, :send_at, :delivery_attempts, :created_at, :updated_at
json.url blast_url(blast, format: :json)
