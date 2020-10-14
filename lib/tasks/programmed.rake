desc 'Tareas programadas diarias'
task :programmed => :environment do
  player = Player.new
  player.daily_amount
  weather_request =WeatherService.new
  weather_request.weather_api
end