class AddDirectorReferenceToCrews < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :crews, :directors
    add_index :crews, :director_id
    change_column_null :crews, :director_id, false
  end
end
