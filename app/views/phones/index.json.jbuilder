json.array!(@phones) do |phone|
  json.extract! phone, :id, :type, :name, :number
  json.url phone_url(phone, format: :json)
end
