#  This file should contain all the record creation needed to seed the database with its default
#  values.
#  The data can then be loaded with the rails db:seed command (or created alongside the database
#  with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

raw_json = File.read(File.join(File.dirname(__FILE__), "seeds/card_data.json"))
card_data = JSON.parse(raw_json)
kingdom_cards = card_data.reject do |card|
  card["cardset_tags"].include?("base") ||
    card["types"].include?("Event") ||
    card["types"].include?("Landmark") ||
    card["types"].include?("State") ||
    card["types"].include?("Hex")
end

Card.destroy_all

kingdom_cards.each do |card|
  Card.create(name: card["card_tag"])
end

20.times do |i|
  k = Kingdom.create(name: "Kingdom #{i}")
  k.cards << Card.all.sample(10)
end
