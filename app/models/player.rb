class Player < ApplicationRecord
  has_many :round_details, dependent: :destroy
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

  def self.check_amount
    @players = Player.all
    i=0
    @players.each do |player|
      if player.amount> 0
        i+=1
      end
    end
    puts i
    if i == 0
      return true
    else
      return false
    end
    
  end
end


