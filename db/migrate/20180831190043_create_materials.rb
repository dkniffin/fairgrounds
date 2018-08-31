class CreateMaterials < ActiveRecord::Migration[5.1]
  def change
    create_table :materials do |t|
      t.string :name
      t.boolean :token
      t.boolean :mat
      t.string :image_name

      t.timestamps
    end
  end
end
