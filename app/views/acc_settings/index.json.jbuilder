json.array!(@acc_settings) do |acc_setting|
  json.extract! acc_setting, :id, :bank, :log_num, :organisation_name, :fin_year_ending
  json.url acc_setting_url(acc_setting, format: :json)
end
