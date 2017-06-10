json.array!(@spouses) do |spouse|
  json.extract! spouse, :id, :first_name, :last_name, :date_of_birth, :gender, :anniversary, :employee_id
  json.url spouse_url(spouse, format: :json)
end
