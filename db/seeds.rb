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
  Card.create(name: card["card_tag"])
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
