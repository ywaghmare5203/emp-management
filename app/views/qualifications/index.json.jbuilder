json.array!(@qualifications) do |qualification|
  json.extract! qualification, :id, :type, :title, :grade, :end_date, :status, :school
  json.url qualification_url(qualification, format: :json)
end
