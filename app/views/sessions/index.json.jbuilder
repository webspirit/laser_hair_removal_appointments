json.array!(@sessions) do |session|
  json.extract! session, :id, :price
  json.url session_url(session, format: :json)
end
