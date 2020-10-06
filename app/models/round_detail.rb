class RoundDetail < ApplicationRecord
  belongs_to :player
  belongs_to :round
  enum chosen_color: [:verde, :rojo, :negro]
#llamado a la API Weather Bit
  @hot_weather = false
  def self.weather_api
    require 'uri'
    require 'net/http'
    require "json"
    url = URI("https://api.weatherbit.io/v2.0/forecast/daily?city=Santiago&key=a01895cdf39141f9a8a77e66aafbcca2")
    
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    
    request = Net::HTTP::Get.new(url)
    https.use_ssl = true
    https.verify_mode = OpenSSL::SSL::VERIFY_PEER
    request["cache-control"] = 'no-cache'
    request["Postman-Token"] = 'e29ce4a5-022b-47aa-b42a-bb571635fc04'
    
    response = https.request(request)
    resp = JSON.parse response.read_body
    temp =[]
    resp["data"].each do |r|
      temp.push(r["high_temp"]) 
    end
    if temp[6]>24
      return @hot_weather = true
    else
      return @hot_weather = false
    end
    
  end
  #Monto de las apuestas segun el clima 
  def self.create_round_detail(players,round)
    players.each do |player|
      r = Random.new
      if @hot_weather==true
        if player.amount <= 1000 && player.amount !=0
          round_detail = RoundDetail.create(player_id:player.id,round_id:round.id,betted_money:player.amount,chosen_color:r.rand(0..2))
          
          player.amount = 0
          player.save
        elsif player.amount > 1000
          amount = player.amount * ((3 + rand(1..4)).to_f/100).to_f
          round_detail = RoundDetail.create(player_id:player.id,round_id:round.id,betted_money:amount.to_i,chosen_color:r.rand(0..2))
          player.amount-= amount
          
          player.save
        else
          puts "no se puede apostar"
        end
      else
        if player.amount <= 1000 && player.amount !=0
          round_detail = RoundDetail.create(player_id:player.id,round_id:round.id,betted_money:player.amount,chosen_color:r.rand(0..2))
          
          player.amount = 0
          player.save
        elsif player.amount > 1000
          amount = player.amount * ((8 + rand(1..7)).to_f/100).to_f
          round_detail = RoundDetail.create(player_id:player.id,round_id:round.id,betted_money:amount.to_i,chosen_color:r.rand(0..2))
          player.amount-= amount
          
          player.save
        else
          puts "no se puede apostar"
        end
      end
    end
  end
end
