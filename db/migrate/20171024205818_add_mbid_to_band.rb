class AddMbidToBand < ActiveRecord::Migration[5.0]
  def change
    add_column :bands, :mb_id, :string
  end
end
