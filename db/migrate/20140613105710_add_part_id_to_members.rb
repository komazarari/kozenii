class AddPartIdToMembers < ActiveRecord::Migration
  def change
    add_column :members, :part_id, :integer
  end
end
