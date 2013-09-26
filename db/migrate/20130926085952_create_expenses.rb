class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.date :used_date
      t.integer :amount
      t.text :spend_for
      t.text :comment
      t.boolean :adjusted, default: true
      t.boolean :valid_req

      t.timestamps
    end
  end
end
