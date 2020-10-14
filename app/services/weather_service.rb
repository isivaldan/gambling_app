class WeatherService
  # servicio para llamar a la API
  require 'uri'
  require 'net/http'
  require 'json'
  # llamado a la API Weather Bit
  attr_reader :hot_weather
  @hot_weather = false

  def weather_api
    url = URI('https://api.weatherbit.io/v2.0/forecast/daily?city=Santiago&key=a01895cdf39141f9a8a77e66aafbcca2')
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    request = Net::HTTP::Get.new(url)
    https.use_ssl = true
    https.verify_mode = OpenSSL::SSL::VERIFY_PEER
    request['cache-control'] = 'no-cache'
    request['Postman-Token'] = 'e29ce4a5-022b-47aa-b42a-bb571635fc04'
    response = https.request(request)
    response = JSON.parse response.read_body
    temp = []
    response['data'].each_with_index do |r, index|
      temp.push(r['high_temp'])
      break if index > 6
    end
    @hot_weather = temp.any? { |t| t > 24 }
  end
end
