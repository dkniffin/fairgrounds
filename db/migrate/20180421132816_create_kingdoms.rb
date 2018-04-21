class CreateKingdoms < ActiveRecord::Migration[5.1]
  def change
    create_table :kingdoms do |t|
      t.string :name

      t.timestamps
    end
  end
end
