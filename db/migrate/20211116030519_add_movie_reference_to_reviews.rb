class AddMovieReferenceToReviews < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :reviews, :movies
    add_index :reviews, :movie_id
    change_column_null :reviews, :movie_id, false
  end
end
