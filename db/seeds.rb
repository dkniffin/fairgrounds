################## CARDS ##################
Card.destroy_all

Rake::Task["import:cards"].invoke

################## KINGDOMS ##################
Kingdom.destroy_all

kingdoms_json = File.read(File.join(File.dirname(__FILE__), "../data/kingdoms.json"))
kingdoms_data = JSON.parse(kingdoms_json)

kingdoms_data.each do |kingdom_data|
  kingdom = Kingdom.new(name: kingdom_data["name"])

  kingdom_data["cards"].each do |card_name|
    kingdom.cards << Card.find_by(name: card_name)
  end
  kingdom.save
end

################## MATERIALS ##################
Material.destroy_all

Rake::Task["import:materials"].invoke
Rake::Task["import:card_dependencies"].invoke
