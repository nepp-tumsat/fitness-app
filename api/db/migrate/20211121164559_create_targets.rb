class CreateTargets < ActiveRecord::Migration[6.1]
  def change
    create_table :targets do |t|
      t.integer :user_id, null: false
      t.float :weight
      t.float :body_fat_rate
      t.integer :daily_energy
      t.date :weight_limit
      t.date :body_fat_rate_limit
      
      t.timestamps
    end
  end
end
