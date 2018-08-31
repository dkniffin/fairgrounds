namespace :import do
  task materials: :environment do
    # Create materials
    material_data = [
      {
        key: :island_mats,
        name: "Island Mats",
        token: false,
        mat: true,
        image_name: "Island_mat.png"
      },
      {
        key: :native_village_mats,
        name: "Native Village Mats",
        token: false,
        mat: true,
        image_name: "Native_Village_mat.jpg"
      },
      {
        key: :pirate_ship_mats,
        name: "Pirate Ship Mats",
        token: false,
        mat: true,
        image_name: "Pirate_Ship_mat.jpg"
      },
      {
        key: :trade_route_mat,
        name: "Trade Route Mat",
        token: false,
        mat: true,
        image_name: "Trade_Route_mat.jpg"
      },
      {
        key: :victory_point_mats,
        name: "Victory Point Mats",
        token: false,
        mat: true,
        image_name: "VP_mat_1.jpg"
      },
      {
        key: :tavern_mats,
        name: "Tavern Mats",
        token: false,
        mat: true,
        image_name: "Tavern_mat.jpg"
      },
      {
        key: :coffer_mats,
        name: "Coffer Mats",
        token: false,
        mat: true,
        image_name: "Coffers.jpg"
      },

      # TODO: Get images for these
      {
        key: :victory_tokens,
        name: "Victory Tokens",
        token: true,
        mat: false
      },
      {
        key: :coin_tokens,
        name: "Coin Tokens",
        token: true,
        mat: false
      },
      {
        key: :embargo_tokens,
        name: "Embargo Tokens",
        token: true,
        mat: false
      },
      {
        key: :debt_tokens,
        name: "Debt Tokens",
        token: true,
        mat: false
      },

      {
        key: :trashing_tokens,
        name: "Trashing Tokens",
        token: true,
        mat: false,
        image_name: "Trashing_token.png"
      },
      {
        key: :journey_tokens,
        name: "Journey Tokens",
        token: true,
        mat: false,
        image_name: "Journey_token.png"
      },
      {
        key: :estate_tokens,
        name: "Estate Tokens",
        token: true,
        mat: false,
        image_name: "Estate_token.png"
      },
      {
        key: :plus_one_card_tokens,
        name: "+1 Card Tokens",
        token: true,
        mat: false,
        image_name: "PlusCard_token.png"
      },
      {
        key: :plus_one_action_tokens,
        name: "+1 Action Tokens",
        token: true,
        mat: false,
        image_name: "Action_token.png"
      },
      {
        key: :plus_one_buy_tokens,
        name: "+1 Buy Tokens",
        token: true,
        mat: false,
        image_name: "Buy_token.png"
      },
      {
        key: :plus_one_coin_tokens,
        name: "+1 Coin Tokens",
        token: true,
        mat: false,
        image_name: "PlusCoin_token.png"
      },
      {
        key: :minus_two_cost_tokens,
        name: "-2 Cost Tokens",
        token: true,
        mat: false,
        image_name: "MinusCost_token.png"
      },
      {
        key: :minus_one_card_tokens,
        name: "-1 Card Tokens",
        token: true,
        mat: false,
        image_name: "MinusCard_token.png"
      },
      {
        key: :minus_one_coin_tokens,
        name: "-1 Coin Tokens",
        token: true,
        mat: false,
        image_name: "MinusCoin_token.png"
      }
    ]
    materials = {}

    material_data.each do |data|
      key = data[:key]
      materials[key] = Material.create(
        name: data[:name],
        token: data[:token],
        mat: data[:mat],
        image_name: data[:image_name]
      )
    end

    # TODO: Create associations between materials and cards
  end
end
