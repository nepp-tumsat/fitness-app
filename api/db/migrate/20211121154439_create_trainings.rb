class CreateTrainings < ActiveRecord::Migration[6.1]
  def change
    create_table :trainings do |t|
      t.integer :user_id, null: false
      t.integer :training_content_id, null: false
      t.integer :rep, null: false
      t.float :weight
      t.datetime :done_at, null:false
      
      t.timestamps
    end
  end
end
