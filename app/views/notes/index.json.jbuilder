json.array!(@notes) do |note|
  json.extract! note, :id, :comment, :date
  json.url note_url(note, format: :json)
end
