class AddSeasonIdToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :season_id, :integer
    add_index :categories, :season_id
  end
end
