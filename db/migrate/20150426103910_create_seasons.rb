class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.integer :index, null: false
      t.string :description

      t.timestamps
    end
  end
end
