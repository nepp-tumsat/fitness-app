class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :gender, :integer, null: false, default: 0
    add_column :users, :birthday, :date
    add_column :users, :tall, :float

    remove_column :users, :nickname, :string

  end
end
