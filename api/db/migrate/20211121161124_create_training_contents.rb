class CreateTrainingContents < ActiveRecord::Migration[6.1]
  def change
    create_table :training_contents do |t|
      t.integer :user_id #CurrentUser以外が登録したtraining_contentsを表示させないために
      t.string :name, null: false
      t.string :site
      t.string :part
      t.text :description
      t.string :unit, null: false
      
      t.timestamps
    end
  end
end
