class AddCategoryIdToMembers < ActiveRecord::Migration
  def change
    add_column :members, :category_id, :integer
  end
end
