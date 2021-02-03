class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :original_url
      t.string :code

      t.timestamps
    end

    add_index :links, :code
    add_index :links, :original_url
  end
end
