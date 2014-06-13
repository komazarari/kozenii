class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :basic_due, default: 0
      t.integer :ext_due, default: 0

      t.timestamps
    end
  end
end
