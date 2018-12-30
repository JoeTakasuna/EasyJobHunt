class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.integer :user

      t.timestamps
    end
  end
end
