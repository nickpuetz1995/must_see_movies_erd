class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :image
      t.string :bio
      t.integer :year
      t.integer :duration

      t.timestamps
    end
  end
end
