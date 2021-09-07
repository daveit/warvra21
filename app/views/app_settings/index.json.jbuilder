json.array!(@app_settings) do |app_setting|
  json.extract! app_setting, :id, :Vrate, :Irate, :LastInvNum
  json.url app_setting_url(app_setting, format: :json)
end
