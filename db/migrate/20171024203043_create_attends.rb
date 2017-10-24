class CreateAttends < ActiveRecord::Migration[5.0]
  def change
    create_table :attends do |t|
      t.references :user, foreign_key: true
      t.references :concert, foreign_key: true

      t.timestamps
    end
  end
end
