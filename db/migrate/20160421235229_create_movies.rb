class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.text :title
      t.text :actors
      t.text :genre
      t.integer :year
      t.integer :rating 
    end
  end
end
