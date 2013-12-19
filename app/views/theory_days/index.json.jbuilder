json.array!(@theory_days) do |theory_day|
  json.extract! theory_day, :id, :start_date, :start_time, :end_time, :repeat_weekly, :school_class_id
  json.url theory_day_url(theory_day, format: :json)
end
