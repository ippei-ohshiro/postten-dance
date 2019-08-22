class AddCommentToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :comment, :string
  end
end
