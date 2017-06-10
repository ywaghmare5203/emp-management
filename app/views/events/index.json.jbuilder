json.array!(@events) do |event|
  json.extract! event, :id, :employee, :type, :name, :start_date, :end_date, :away
  json.url event_url(event, format: :json)
end
