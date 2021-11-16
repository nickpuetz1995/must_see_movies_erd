class AddActorReferenceToCasts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :casts, :actors
    add_index :casts, :actor_id
    change_column_null :casts, :actor_id, false
  end
end
