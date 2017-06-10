json.array!(@next_of_kins) do |next_of_kin|
  json.extract! next_of_kin, :id, :first_name, :last_name, :address, :contact_number, :relation
  json.url next_of_kin_url(next_of_kin, format: :json)
end
