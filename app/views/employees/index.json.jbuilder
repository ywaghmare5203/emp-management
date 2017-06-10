json.array!(@employees) do |employee|
  json.extract! employee, :id, :first_name, :last_name, :service_no, :date_of_birth
  json.url employee_url(employee, format: :json)
end
