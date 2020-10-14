class Player < ApplicationRecord
  has_many :round_details, dependent: :destroy
  has_many :rounds, through: :round_details
  validates :name, presence: true
  validates :amount, presence: true
  # monto diario que reciben los jugadores
  after_initialize do
    self.amount ||= 10_000
  end
  def daily_amount
    @players = Player.all
    @players.each do |player|
      player.amount += 10_000
      player.save
    end
  end
  def check_amount
    @players = Player.all
    i = 0
    @players.each do |player|
      if player.amount.positive?
        i += 1
      end
    end
    i == 0
  end
end
