class AddAssosiationsToMembers < ActiveRecord::Migration
  def change
    add_column :incomes, :member_id, :integer
    add_column :expenses, :member_id, :integer
  end
end
