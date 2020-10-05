class AddDefaultValueToPlayerAmount < ActiveRecord::Migration[6.0]
  def change
    change_column_default :players, :amount, from: nil, to: 10000
  end
end
