class Round < ApplicationRecord
  has_many :round_details, dependent: :destroy
  has_many :players, through: :round_details
  enum result_color: [:green, :red, :black]
  # Elije el color para la nueva ronda Verde 2% Rojo 49% y Negro 49%
  def random_bet
    random_percentage = Random.new
    random_percentage = random_percentage.rand(1...100)
    if random_percentage < 3
      Round.create(result_color: 0)
    elsif random_percentage > 3 && random_percentage >= 52
      Round.create(result_color: 1)
    else
      Round.create(result_color: 2)
    end
  end

  # Cantidad de dinero segun apuesta
  def total_amount_bet

    round_details.each do |round_detail|
      player = round_detail.player
      if round_detail.chosen_color == result_color
        if round_detail.chosen_color == 0
          amount_won = round_detail.betted_money * 15
        else
          amount_won = round_detail.betted_money * 2
        end
        player.amount += amount_won
      else
        player.amount -= round_detail.betted_money
      end
      player.save
    end
  end

  # crear round con apuestas
  def create_round
    return unless Player.check_amount?

    @round = Round.new
    @round = @round.random_bet
    @players = Player.with_money
    RoundDetail.create_round_detail(@players, @round)
    @round.total_amount_bet
  end
end