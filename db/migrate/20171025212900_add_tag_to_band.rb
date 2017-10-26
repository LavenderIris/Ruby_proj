class AddTagToBand < ActiveRecord::Migration[5.0]
  def change
    add_column :bands, :tag, :string
  end
end
