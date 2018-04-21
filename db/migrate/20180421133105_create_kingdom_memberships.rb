class CreateKingdomMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :kingdom_memberships do |t|
      t.references :card, foreign_key: true
      t.references :kingdom, foreign_key: true

      t.timestamps
    end
  end
end
