class AddUserReferenceToReviews < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :reviews, :users
    add_index :reviews, :user_id
    change_column_null :reviews, :user_id, false
  end
end
