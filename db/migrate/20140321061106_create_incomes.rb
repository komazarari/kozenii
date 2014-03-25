class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.date :obtained_date
      t.integer :amount
      t.text :obtained_by
      t.text :comment
      t.boolean :valid_req, default: true

      t.timestamps
    end
  end
end
