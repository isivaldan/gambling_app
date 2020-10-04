class CreateRoundDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :round_details do |t|
      t.float :betted_money
      t.integer :chosen_color
      t.references :player, null: false, foreign_key: true
      t.references :round, null: false, foreign_key: true

      t.timestamps
    end
  end
end
