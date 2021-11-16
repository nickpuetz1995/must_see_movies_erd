class CreateCrews < ActiveRecord::Migration[6.0]
  def change
    create_table :crews do |t|
      t.integer :movie_id
      t.integer :director_id

      t.timestamps
    end
  end
end
