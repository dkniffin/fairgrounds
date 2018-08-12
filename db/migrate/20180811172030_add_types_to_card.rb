class AddTypesToCard < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :event, :boolean
    add_column :cards, :action, :boolean
    add_column :cards, :duration, :boolean
    add_column :cards, :attack, :boolean
    add_column :cards, :reaction, :boolean
    add_column :cards, :treasure, :boolean
    add_column :cards, :reserve, :boolean
    add_column :cards, :traveller, :boolean
    add_column :cards, :victory, :boolean
    add_column :cards, :curse, :boolean
    add_column :cards, :trash, :boolean
    add_column :cards, :prize, :boolean
    add_column :cards, :looter, :boolean
    add_column :cards, :shelter, :boolean
    add_column :cards, :landmark, :boolean
    add_column :cards, :castle, :boolean
    add_column :cards, :gathering, :boolean
    add_column :cards, :hex, :boolean
    add_column :cards, :fate, :boolean
    add_column :cards, :night, :boolean
    add_column :cards, :heirloom, :boolean
    add_column :cards, :doom, :boolean
    add_column :cards, :state, :boolean
    add_column :cards, :spirit, :boolean
    add_column :cards, :boon, :boolean
    add_column :cards, :zombie, :boolean
  end
end
