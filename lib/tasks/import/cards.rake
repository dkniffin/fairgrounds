namespace :import do
  task cards: :environment do
    raw_json = File.read(File.join(File.dirname(__FILE__), "../../../data/card_data.json"))
    card_data = JSON.parse(raw_json)

    def supply?(card_data)
      non_kingdom_types = %w(Landmark Event Boon Hex State Prize Shelter Heirloom Spirit Zombie)
      return false if non_kingdom_types.any? { |type| card_data["types"].include?(type) }

      return false if card_data["types"].include?("Traveller") &&
                      !%w(Page Peasant).include?(card_data["card_tag"])

      specific_cards = [
        "Copper", "Silver", "Gold", "Platinum", "Potion", "Estate", "Duchy", "Province", "Colony",
        "Curse", "Bag of Gold", "Bat", "Champion", "Teacher", "Madman", "Mercenary", "Spoils"
      ]
      return false if specific_cards.include?(card_data["card_tag"])

      # All cards not covered by the above cases are kingdom cards
      true
    end

    card_data.each do |card|
      Card.create(
        name: card["card_tag"],
        event: card["types"].include?("Event"),
        action: card["types"].include?("Action"),
        duration: card["types"].include?("Duration"),
        attack: card["types"].include?("Attack"),
        reaction: card["types"].include?("Reaction"),
        treasure: card["types"].include?("Treasure"),
        reserve: card["types"].include?("Reserve"),
        traveller: card["types"].include?("Traveller"),
        victory: card["types"].include?("Victory"),
        curse: card["types"].include?("Curse"),
        trash: card["types"].include?("Trash"),
        prize: card["types"].include?("Prize"),
        looter: card["types"].include?("Looter"),
        shelter: card["types"].include?("Shelter"),
        landmark: card["types"].include?("Landmark"),
        castle: card["types"].include?("Castle"),
        gathering: card["types"].include?("Gathering"),
        hex: card["types"].include?("Hex"),
        fate: card["types"].include?("Fate"),
        night: card["types"].include?("Night"),
        heirloom: card["types"].include?("Heirloom"),
        doom: card["types"].include?("Doom"),
        state: card["types"].include?("State"),
        spirit: card["types"].include?("Spirit"),
        boon: card["types"].include?("Boon"),
        zombie: card["types"].include?("Zombie"),
        supply: supply?(card)
      )
    end
  end
end
