class AddSupplyToCard < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :supply, :boolean
  end
end
