class RoundDetail < ApplicationRecord
  belongs_to :player
  belongs_to :round
  enum chosen_color: [:green, :red, :black]
  
  # Monto de las apuestas segun el clima
  def self.create_round_detail(players, round)
    players.each do |player|
      random_color = Random.new
      weather_check = WeatherService.new
      if  weather_check.hot_weather == true
        if player.amount <= 1000 && player.amount != 0
          RoundDetail.create(player_id: player.id, round_id: round.id, betted_money: player.amount, chosen_color: random_color.rand(0..2))
          player.amount = 0
        elsif player.amount > 1000 
          amount = player.amount * (rand(3..7).to_f / 100.to_f)
          RoundDetail.create(player_id: player.id, round_id: round.id, betted_money: amount.to_i, chosen_color: random_color.rand(0..2))
        end
      else
        if player.amount <= 1000 && player.amount != 0
          RoundDetail.create(player_id: player.id, round_id: round.id, betted_money: player.amount, chosen_color: random_color.rand(0..2))
          player.amount = 0
        elsif player.amount > 1000
          amount = player.amount * (rand(8..15).to_f / 100.to_f)
          RoundDetail.create(player_id: player.id, round_id: round.id, betted_money: amount.to_i, chosen_color: random_color.rand(0..2))
        end
      end
      player.save
    end
  end
end