class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :fullname
      t.string :nick
      t.string :yomi
      t.integer :obligation, default: 0, null: false

      t.timestamps
    end
  end
end
