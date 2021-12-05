class AddForeignKey < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :trainings, :users, on_update: :cascade, on_delete: :cascade
    add_foreign_key :trainings, :training_contents, on_update: :cascade, on_delete: :cascade
    add_foreign_key :user_body_compositions, :users, on_update: :cascade, on_delete: :cascade
    add_foreign_key :memos, :users, on_update: :cascade, on_delete: :cascade
    add_foreign_key :targets, :users, on_update: :cascade, on_delete: :cascade
    add_foreign_key :user_diet_logs, :users, on_update: :cascade, on_delete: :cascade
    add_foreign_key :eaten_scraped_food_weights, :user_diet_logs, on_update: :cascade, on_delete: :cascade
    add_foreign_key :eaten_scraped_food_weights, :scraped_foods, on_update: :cascade, on_delete: :cascade
    add_foreign_key :eaten_user_food_weights, :user_diet_logs, on_update: :cascade, on_delete: :cascade
    add_foreign_key :eaten_user_food_weights, :user_created_foods, on_update: :cascade, on_delete: :cascade
  end
end
