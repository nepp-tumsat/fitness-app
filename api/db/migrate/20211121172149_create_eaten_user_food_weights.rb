class CreateEatenUserFoodWeights < ActiveRecord::Migration[6.1]
  def change
    create_table :eaten_user_food_weights do |t|
      t.integer :user_diet_log_id, null: false
      t.integer :user_created_food_id, null: false
      t.float :gram
      t.timestamps
    end
  end
end
