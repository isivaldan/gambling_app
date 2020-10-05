class RenameMoneyFromPlayer < ActiveRecord::Migration[6.0]
  def change
    rename_column :players, :money, :amount
  end
end
