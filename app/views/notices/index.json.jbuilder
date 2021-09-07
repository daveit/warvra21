json.array!(@notices) do |notice|
  json.extract! notice, :id, :title, :notes, :finalised
  json.url notice_url(notice, format: :json)
end
