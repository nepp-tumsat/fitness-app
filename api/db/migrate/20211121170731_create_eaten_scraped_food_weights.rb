class CreateEatenScrapedFoodWeights < ActiveRecord::Migration[6.1]
  def change
    create_table :eaten_scraped_food_weights do |t|
      t.integer :user_diet_log_id, null: false
      t.integer :scraped_food_id, null: false
      t.float :gram
      
      t.timestamps
    end
  end
end
