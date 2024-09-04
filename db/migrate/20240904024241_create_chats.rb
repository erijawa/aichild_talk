class CreateChats < ActiveRecord::Migration[7.2]
  def change
    create_table :chats do |t|
      t.string :title, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
