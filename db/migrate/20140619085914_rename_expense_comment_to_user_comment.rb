class RenameExpenseCommentToUserComment < ActiveRecord::Migration
  def change
    rename_column :expenses, :comment, :user_note
  end
end
