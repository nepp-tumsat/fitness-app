class CreateUserDietLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :user_diet_logs do |t|
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
