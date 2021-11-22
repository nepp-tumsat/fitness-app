class CreateTrainingContents < ActiveRecord::Migration[6.1]
  def change
    create_table :training_contents do |t|
      t.string :name, null: false
      t.string :type
      t.string :part
      t.text :description
      t.string :unit, null: false
      
      t.timestamps
    end
  end
end
