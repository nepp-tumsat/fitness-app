class CreateScrapedFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :scraped_foods do |t|
      t.string :name, null: false
      t.float :protein, null: false
      t.float :fat, null: false
      t.float :carbohydrates, null: false
      t.integer :energy
      t.timestamps
    end
  end
end
