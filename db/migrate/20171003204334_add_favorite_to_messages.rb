class AddFavoriteToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :favorite, :boolean, default: false
  end
end
