json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :price
  json.url appointment_url(appointment, format: :json)
end
