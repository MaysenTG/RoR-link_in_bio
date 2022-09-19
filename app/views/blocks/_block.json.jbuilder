json.extract! block, :id, :type, :url, :created_at, :updated_at
json.url block_url(block, format: :json)
