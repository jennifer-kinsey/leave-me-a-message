class MessagesTableSetup < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.column :body, :string
      t.timestamps
    end
  end
end
