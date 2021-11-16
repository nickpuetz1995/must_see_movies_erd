class AddMovieReferenceToCasts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :casts, :movies
    add_index :casts, :movie_id
    change_column_null :casts, :movie_id, false
  end
end
