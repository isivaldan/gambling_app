class Player < ApplicationRecord
  has_many :round_details,dependent: :destroy
  has_many :rounds, :through => :round_details
  validates :name, presence: true
#monto diario que reciben los jugadores

  def self.daily_amount
      
    @players = Player.all
    @players.each do |player|
      player.money+=10000
      player.save
    end
  end
#handle_asynchronously :daily_amount, :run_at => Proc.new { 24.hours.from_now }
  
end
