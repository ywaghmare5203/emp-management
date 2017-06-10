json.array!(@responsibilities) do |responsibility|
  json.extract! responsibility, :id, :employee, :name, :description
  json.url responsibility_url(responsibility, format: :json)
end
