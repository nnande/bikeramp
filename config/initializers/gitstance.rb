Gistance.configure do |c|
  c.api_key = Rails.application.secrets.google_distance_matrix_api_key
  c.units = 'metric'
  c.language = 'pl'
  c.sensor = true
end
