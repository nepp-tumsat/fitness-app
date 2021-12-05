class CreateMemos < ActiveRecord::Migration[6.1]
  def change
    create_table :memos do |t|
      t.integer :user_id, null: false
      t.text :note
      t.date :maked_at, null: false
      t.timestamps
    end
  end
end
