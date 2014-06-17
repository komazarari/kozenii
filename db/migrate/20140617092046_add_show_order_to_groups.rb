class AddShowOrderToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :show_order, :integer
  end
end
