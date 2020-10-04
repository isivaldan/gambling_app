class Player < ApplicationRecord
  has_many :round_details,dependent: :destroy
  has_many :rounds, :through => :round_details
#monto diario que reciben los jugadores
  def self.amount
      
    @players = Player.all
    @players.each do |player|
      player.money+=10000
      player.save
    end
  end
#monto por ronda ganada
  def self.round_winner(players,round)
    players.each do |player|
      player.round_details.each do |p|
        if round.result_color == p.chosen_color
          player.money*2
          player.save
        end
      end
    end
  end
  
end
