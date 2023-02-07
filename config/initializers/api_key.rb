if Rails.env.production?
  API_KEY = ENV['API_KEY']
else
  Dotenv.load
  API_KEY = ENV.fetch('API_KEY')
end