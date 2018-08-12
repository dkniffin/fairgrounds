#  This file should contain all the record creation needed to seed the database with its default
#  values.
#  The data can then be loaded with the rails db:seed command (or created alongside the database
#  with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

################## CARDS ##################
Card.destroy_all

raw_json = File.read(File.join(File.dirname(__FILE__), "seeds/card_data.json"))
card_data = JSON.parse(raw_json)

kingdom_cards = card_data.reject do |card|
  card["cardset_tags"].include?("base")
end

kingdom_cards.each do |card|
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
    non_kingdom: non_kingdom?(card["name"])
  )
end

################## KINGDOMS ##################
Kingdom.destroy_all

kingdoms_json = File.read(File.join(File.dirname(__FILE__), "seeds/kingdoms.json"))
kingdoms_data = JSON.parse(kingdoms_json)

kingdoms_data.each do |kingdom_data|
  kingdom = Kingdom.new(name: kingdom_data["name"])

  kingdom_data["cards"].each do |card_name|
    kingdom.cards << Card.find_by(name: card_name)
  end
  kingdom.save
end
