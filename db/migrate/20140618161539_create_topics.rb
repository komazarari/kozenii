class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.text :body
      t.boolean :enabled, default: true

      t.timestamps
    end
  end
end
