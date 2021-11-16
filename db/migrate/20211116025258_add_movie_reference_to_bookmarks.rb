class AddMovieReferenceToBookmarks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :bookmarks, :movies
    add_index :bookmarks, :movie_id
    change_column_null :bookmarks, :movie_id, false
  end
end
