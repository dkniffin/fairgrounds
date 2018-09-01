class CreateCardDependencies < ActiveRecord::Migration[5.1]
  def change
    create_table :card_dependencies do |t|
      t.references :card, foreign_key: true
      t.references :dependency, polymorphic: true

      t.timestamps
    end
  end
end
