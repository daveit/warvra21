json.array!(@inews) do |inews|
  json.extract! inews, :id, :title, :first, :last, :idate, :description, :status, :total, :subject, :body, :fromemail
  json.url inews_url(inews, format: :json)
end
