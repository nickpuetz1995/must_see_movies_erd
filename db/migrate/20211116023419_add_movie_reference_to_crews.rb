class AddMovieReferenceToCrews < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :crews, :movies
    add_index :crews, :movie_id
    change_column_null :crews, :movie_id, false
  end
end
