class CreateLinkMenus < ActiveRecord::Migration
  def change
    create_table :link_menus do |t|
      t.string :viewtext, null: false
      t.text :url, null: false
      t.boolean :enabled, default: true

      t.timestamps
    end
  end
end
