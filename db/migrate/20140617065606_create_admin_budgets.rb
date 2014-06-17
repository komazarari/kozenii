class CreateAdminBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.string :title
      t.integer :amount
      t.integer :group_id

      t.timestamps
    end
  end
end
