class ChangeAmountToBeIntegerInPlayers < ActiveRecord::Migration[6.0]
  def change
    change_column :players, :amount, :integer
  end
end
