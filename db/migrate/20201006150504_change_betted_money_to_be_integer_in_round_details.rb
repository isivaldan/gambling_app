class ChangeBettedMoneyToBeIntegerInRoundDetails < ActiveRecord::Migration[6.0]
  def change
    change_column :round_details, :betted_money, :integer
  end
end
