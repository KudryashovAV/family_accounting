Identity.setup do |config|
  config.user_class_name = "User"
  config.omniauth :google_oauth2, ENV['GOOGLE_KEY'], ENV['GOOGLE_SECRET']
end
