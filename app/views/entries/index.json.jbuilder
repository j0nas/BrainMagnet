json.array!(@entries) do |entry|
  json.extract! entry, :id, :date, :mood, :sleep
  json.url entry_url(entry, format: :json)
end
