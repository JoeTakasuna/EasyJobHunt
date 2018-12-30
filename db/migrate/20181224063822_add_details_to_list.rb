class AddDetailsToList < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :company, :text
    add_column :lists, :type1, :integer
    add_column :lists, :type2, :integer
    add_column :lists, :detail, :text
    add_column :lists, :status1, :integer
    add_column :lists, :status2, :integer
    add_column :lists, :date, :date
    add_column :lists, :note, :text
  end
end
