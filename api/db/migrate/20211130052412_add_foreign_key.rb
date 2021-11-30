class AddForeignKey < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :trainings, :users
    add_foreign_key :trainings, :training_contents
    add_foreign_key :user_body_compositions, :users
    add_foreign_key :memos, :users
    add_foreign_key :targets, :users
    add_foreign_key :user_diet_logs, :users
    add_foreign_key :eaten_scraped_food_weights, :user_diet_logs
    add_foreign_key :eaten_scraped_food_weights, :scraped_foods
    add_foreign_key :eaten_user_food_weights, :user_diet_logs
    add_foreign_key :eaten_user_food_weights, :user_created_foods
  end
end
