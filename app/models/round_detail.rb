class RoundDetail < ApplicationRecord
  belongs_to :player
  belongs_to :round
  enum chosen_color: [:verde, :rojo, :negro]
  def weather_api
    require 'uri'
    require 'net/http'
    
    url = URI("http://api.weatherapi.com/v1/forecast.json?key=f2cb5f6ee27b4ac6bb5161736200310&q=Santiago&days=7")
    
    http = Net::HTTP.new(url.host, url.port)
    
    request = Net::HTTP::Get.new(url)
    request["cache-control"] = 'no-cache'
    request["Postman-Token"] = 'b45f612a-2957-4873-9e27-e88ba193623d'
    
    response = http.request(request)
    puts response.read_body
  end
#Monto de las apuestas segun el clima 
  def self.create_round_detail(players,round)
    players.each do |player|
      r = Random.new
      if player.money <= 1000 && player.money !=0
        round_detail = RoundDetail.create(player_id:player.id,round_id:round.id,betted_money:player.money,chosen_color:r.rand(0..2))

        player.money = 0
        player.save
      elsif player.money > 1000
        money = player.money * ((8 + rand(1..7)).to_f/100).to_f
        round_detail = RoundDetail.create(player_id:player.id,round_id:round.id,betted_money:money.to_i,chosen_color:r.rand(0..2))
        player.money-= money
        
        player.save
      else
        puts "no se puede apostar"
      end
      
    end
  end
end
