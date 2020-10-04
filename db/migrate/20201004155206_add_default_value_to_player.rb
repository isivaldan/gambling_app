class AddDefaultValueToPlayer < ActiveRecord::Migration[6.0]
  def change
    change_column_default :players, :money, from: nil, to: 10000
  end
end
