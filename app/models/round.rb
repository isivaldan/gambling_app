class Round < ApplicationRecord
  has_many :round_details,dependent: :destroy
  has_many :players, :through => :round_details

  enum result_color: [:verde, :rojo, :negro]
  # Elije el color para la nueva ronda
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
  
  def total_amount_per_bet

  end
end
