namespace :import do
  task card_dependencies: :environment do
    # Materials
    tavern_mats = Material.find_by(name: "Tavern Mats")
    victory_tokens = Material.find_by(name: "Victory Tokens")
    coin_tokens = Material.find_by(name: "Coin Tokens")
    debt_tokens = Material.find_by(name: "Debt Tokens")
    trashing_tokens = Material.find_by(name: "Trashing Tokens")
    journey_tokens = Material.find_by(name: "Journey Tokens")
    estate_tokens = Material.find_by(name: "Estate Tokens")
    plus_1_card_tokens = Material.find_by(name: "+1 Card Tokens")
    plus_1_action_tokens = Material.find_by(name: "+1 Action Tokens")
    plus_1_buy_tokens = Material.find_by(name: "+1 Buy Tokens")
    plus_1_coin_tokens = Material.find_by(name: "+1 Coin Tokens")
    minus_2_cost_tokens = Material.find_by(name: "-2 Cost Tokens")
    minus_1_card_tokens = Material.find_by(name: "-1 Card Tokens")
    minus_1_coin_tokens = Material.find_by(name: "-1 Coin Tokens")
    hexes = Material.find_by(name: "Hexes")
    boons = Material.find_by(name: "Boons")

    # Cards
    curse = Card.find_by(name: "Curse")
    cursed_gold = Card.find_by(name: "Cursed Gold")
    spoils = Card.find_by(name: "Spoils")
    imp = Card.find_by(name: "Imp")
    wish = Card.find_by(name: "Wish")

    dependencies = [
      { card_name: "Young Witch", dependency: curse },
      { card_name: "Bridge Troll", dependency: minus_1_coin_tokens },
      # { card_name: "Type: Reserve", dependency: nil }, # TODO: Tavern Mat
      { card_name: "Miser", dependency: tavern_mats },
      # { card_name: "Type: Traveller", dependency: nil }, # TODO: Other travellers in set
      { card_name: "Giant", dependency: journey_tokens },
      { card_name: "Ranger", dependency: journey_tokens },
      { card_name: "Relic", dependency: minus_1_card_tokens },
      { card_name: "Swamp Hag", dependency: curse },
      { card_name: "Familiar", dependency: curse },
      { card_name: "Jester", dependency: curse },
      { card_name: "Witch", dependency: curse },
      { card_name: "Soothsayer", dependency: curse },
      { card_name: "Ill-gotten Gains", dependency: curse },
      { card_name: "Torturer", dependency: curse },
      { card_name: "Replace", dependency: curse },
      { card_name: "Mountebank", dependency: curse },
      { card_name: "Sea Hag", dependency: curse },
      # { card_name: "Cards that cost potion", dependency: nil }, # TODO: Potion
      { card_name: "Tournament", dependency: curse },
      # { card_name: "Tournament", dependency: nil }, # TODO: Prizes
      { card_name: "Bandit Camp", dependency: spoils },
      { card_name: "Marauder", dependency: spoils },
      { card_name: "Pillage", dependency: spoils },
      # { card_name: "Cards of type Looter", dependency: nil }, # TODO: Ruins
      { card_name: "Hermit", dependency: Card.find_by(name: "Madman") },
      { card_name: "Urchin", dependency: Card.find_by(name: "Mercenary") },
      # { card_name: "3?+ Dark Ages cards", dependency: nil }, # TODO: Shelters
      # { card_name: "Settlers/Bustling Village", dependency: nil }, # TODO: Each other
      { card_name: "Capital", dependency: debt_tokens },
      { card_name: "City Quarters", dependency: debt_tokens },
      { card_name: "Engineer", dependency: debt_tokens },
      { card_name: "Fortune", dependency: debt_tokens },
      { card_name: "Overlord", dependency: debt_tokens },
      { card_name: "Royal Blacksmith", dependency: debt_tokens },
      { card_name: "Chariot Race", dependency: victory_tokens },
      { card_name: "Emporium", dependency: victory_tokens },
      { card_name: "Farmer's Market", dependency: victory_tokens },
      { card_name: "Groundskeeper", dependency: victory_tokens },
      { card_name: "Plunder", dependency: victory_tokens },
      { card_name: "Sacrifice", dependency: victory_tokens },
      { card_name: "Temple", dependency: victory_tokens },
      { card_name: "Wild Hunt", dependency: victory_tokens },
      { card_name: "Bishop", dependency: victory_tokens },
      { card_name: "Goons", dependency: victory_tokens },
      { card_name: "Monument", dependency: victory_tokens },
      { card_name: "Baker", dependency: coin_tokens },
      { card_name: "Butcher", dependency: coin_tokens },
      { card_name: "Candlestick Maker", dependency: coin_tokens },
      { card_name: "Merchant Guild", dependency: coin_tokens },
      { card_name: "Plaza", dependency: coin_tokens },
      { card_name: "Bard", dependency: boons },
      { card_name: "Blessed Village", dependency: boons },
      { card_name: "Druid", dependency: boons },
      { card_name: "Cursed Village", dependency: hexes },
      { card_name: "Werewolf", dependency: hexes },
      { card_name: "Skulk", dependency: hexes },
      { card_name: "Devil's Workshop", dependency: imp },
      { card_name: "Exorcist", dependency: imp },
      { card_name: "Idol", dependency: curse },
      { card_name: "Idol", dependency: boons },
      { card_name: "Leprechaun", dependency: wish },
      { card_name: "Leprechaun", dependency: hexes },
      # { card_name: "Necromancer", dependency: nil }, # TODO: Zombies
      { card_name: "Cemetery", dependency: Card.find_by(name: "Haunted Mirror") },
      { card_name: "Cemetery", dependency: Card.find_by(name: "Ghost") },
      { card_name: "Secret Cave", dependency: Card.find_by(name: "Magic Lamp") },
      { card_name: "Secret Cave", dependency: wish },
      { card_name: "Pixie", dependency: boons },
      { card_name: "Pixie", dependency: Card.find_by(name: "Goat") },
      { card_name: "Shepherd", dependency: Card.find_by(name: "Pasture") },
      { card_name: "Tracker", dependency: Card.find_by(name: "Pouch") },
      { card_name: "Tracker", dependency: boons },
      { card_name: "Pooka", dependency: curse },
      { card_name: "Pooka", dependency: cursed_gold },
      { card_name: "Fool", dependency: Card.find_by(name: "Lucky Coin") },
      { card_name: "Fool", dependency: Card.find_by(name: "Lost in the Woods") },
      { card_name: "Fool", dependency: boons },
      { card_name: "Sacred Grove", dependency: boons },
      { card_name: "Tormentor", dependency: imp },
      { card_name: "Tormentor", dependency: hexes },
      { card_name: "Vampire", dependency: hexes },
      { card_name: "Vampire", dependency: Card.find_by(name: "Bat") },
      # { card_name: "Sauna/Avanto", dependency: nil }, # TODO: Each other
      # { card_name: "Black Market", dependency: nil }, # TODO: Black market deck
      { card_name: "Trade Route", dependency: Material.find_by(name: "Trade Route Mat") },
      { card_name: "Embargo", dependency: curse },
      { card_name: "Embargo", dependency: Material.find_by(name: "Embargo Tokens") },
      { card_name: "Island", dependency: Material.find_by(name: "Island Mats") },
      { card_name: "Native Village", dependency: Material.find_by(name: "Native Village Mats") },
      { card_name: "Pirate Ship", dependency: Material.find_by(name: "Pirate Ship Mats") }

    ]
    dependencies.each do |dependency|
      card = Card.find_by(name: dependency[:card_name])
      CardDependency.create(card: card, dependency: dependency[:dependency])
    end

    potion = Card.find_by(name: 'Potion')
    Card.where.not(potion_cost: 0).each do |card|
      CardDependency.create(card: card, dependency: potion)
    end
  end
end
