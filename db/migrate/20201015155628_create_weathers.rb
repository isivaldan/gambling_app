class CreateWeathers < ActiveRecord::Migration[6.0]
  def change
    create_table :weathers do |t|
      t.boolean :hot_weather

      t.timestamps
    end
  end
end
