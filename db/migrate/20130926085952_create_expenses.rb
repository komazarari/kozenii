class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.date :used_date
      t.integer :amount
      t.text :spend_for
      t.text :comment
      t.boolean :adjusted
      t.boolean :valid_req, default: true

      t.timestamps
    end
  end
end
