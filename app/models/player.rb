class Player < ApplicationRecord
  has_many :round_details, dependent: :destroy
  has_many :rounds, through: :round_details
  validates :name, presence: true
  validates :amount, presence: true
  # scope para chequear si los jugadores no tienen dinero
  scope :with_money, -> { where('amount > 0') }
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
  
  def check_amount?
    Player.with_money.count.positive?
  end
end