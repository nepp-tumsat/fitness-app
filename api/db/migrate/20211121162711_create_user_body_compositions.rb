class CreateUserBodyCompositions < ActiveRecord::Migration[6.1]
  def change
    create_table :user_body_compositions do |t|
      t.integer :user_id, null: false
      t.float :weight
      t.float :body_fat_rate

      t.timestamps
    end
  end
end
