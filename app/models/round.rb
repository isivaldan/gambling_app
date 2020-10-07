class Round < ApplicationRecord
  has_many :round_details, dependent: :destroy
  has_many :players, :through => :round_details
  
  
  enum result_color: [:verde, :rojo, :negro]
  # Elije el color para la nueva ronda Verde 2% Rojo 49% y Negro 49%
  def self.random_bet
    r = Random.new
    r = r.rand(1...100)
    if r < 3
      Round.create(result_color:0)
    elsif r > 3 && r >= 52
      Round.create(result_color:1)
    else
      Round.create(result_color:2)
    end
  end
  
  #Cantidad de dinero segun apuesta 
  def total_amount_bet
    
    round_d=RoundDetail.where(round_id:self.id)
    
    round_d.each do|r|
      if r.chosen_color === self.result_color
        player = Player.find(r.player_id)
        if r.chosen_color==0 
          w =r.betted_money*15
          player.amount += w
          player.save
        else
          player = Player.find(r.player_id)
          w =r.betted_money*2
          player.amount += w
          player.save  
        end
      else
        player.amount -= r.betted_money
        player.save
      end
    end
  end
  #crear round con apuestas
  def self.create_round
    if Player.check_amount == false
      @players =Player.all
      @round = Round.random_bet
      RoundDetail.create_round_detail(@players,@round)
      @round.total_amount_bet
    end
  end
  
end
