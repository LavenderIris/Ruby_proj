class CreateConcerts < ActiveRecord::Migration[5.0]
  def change
    create_table :concerts do |t|
      t.date :date
      t.string :venue
      t.string :city
      t.string :state
      t.json :setlist
      t.references :band, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
