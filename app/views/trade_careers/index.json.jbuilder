json.array!(@trade_careers) do |trade_career|
  json.extract! trade_career, :id, :paab_complete, :paab_result, :next_paab, :tiffy_maths_req, :tiffy_maths_complete, :class_2, :class_1, :artificer
  json.url trade_career_url(trade_career, format: :json)
end
