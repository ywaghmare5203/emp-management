json.array!(@reports) do |report|
  json.extract! report, :id, :previous_date, :next_date, :mpar, :mpar_date
  json.url report_url(report, format: :json)
end
