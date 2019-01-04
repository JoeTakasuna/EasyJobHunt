class CreateEvals < ActiveRecord::Migration[5.2]
  def change
    create_table :evals do |t|
      t.integer :company_id

      t.timestamps
    end
  end
end
