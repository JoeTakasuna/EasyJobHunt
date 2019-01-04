class AddSortToConfigs < ActiveRecord::Migration[5.2]
  def change
    add_column :configs, :sort, :integer
  end
end
