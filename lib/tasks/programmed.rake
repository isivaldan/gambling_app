namespace :programmed do
  desc 'Tareas programadas'
  task minutes: :environment do
    Round.new.create_round
  end
  task daily: :environment do
    player = Player.new
    player.daily_amount
  end
  task weekly: :environment do
    weather_request = WeatherService.new
    weather_request.weather_api
  end
end

