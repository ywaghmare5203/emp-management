json.array!(@roles) do |role|
  json.extract! role, :id, :employee_id, :PID, :description, :ancestry, :section
  json.url role_url(role, format: :json)
end
