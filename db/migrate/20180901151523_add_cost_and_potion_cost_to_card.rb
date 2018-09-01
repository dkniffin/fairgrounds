class AddCostAndPotionCostToCard < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :cost, :integer
    add_column :cards, :special_cost, :boolean
    add_column :cards, :potion_cost, :integer
  end
end
