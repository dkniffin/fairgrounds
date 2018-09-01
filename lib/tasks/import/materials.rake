namespace :import do
  task materials: :environment do
    material_data = [
      {
        name: "Island Mats",
        token: false,
        mat: true,
        image_name: "Island_mat.png"
      },
      {
        name: "Native Village Mats",
        token: false,
        mat: true,
        image_name: "Native_Village_mat.jpg"
      },
      {
        name: "Pirate Ship Mats",
        token: false,
        mat: true,
        image_name: "Pirate_Ship_mat.jpg"
      },
      {
        name: "Trade Route Mat",
        token: false,
        mat: true,
        image_name: "Trade_Route_mat.jpg"
      },
      {
        name: "Victory Point Mats",
        token: false,
        mat: true,
        image_name: "VP_mat_1.jpg"
      },
      {
        name: "Tavern Mats",
        token: false,
        mat: true,
        image_name: "Tavern_mat.jpg"
      },
      {
        name: "Coffer Mats",
        token: false,
        mat: true,
        image_name: "Coffers.jpg"
      },

      # TODO: Get images for these
      {
        name: "Victory Tokens",
        token: true,
        mat: false
      },
      {
        name: "Coin Tokens",
        token: true,
        mat: false
      },
      {
        name: "Embargo Tokens",
        token: true,
        mat: false
      },
      {
        name: "Debt Tokens",
        token: true,
        mat: false
      },

      {
        name: "Trashing Tokens",
        token: true,
        mat: false,
        image_name: "Trashing_token.png"
      },
      {
        name: "Journey Tokens",
        token: true,
        mat: false,
        image_name: "Journey_token.png"
      },
      {
        name: "Estate Tokens",
        token: true,
        mat: false,
        image_name: "Estate_token.png"
      },
      {
        name: "+1 Card Tokens",
        token: true,
        mat: false,
        image_name: "PlusCard_token.png"
      },
      {
        name: "+1 Action Tokens",
        token: true,
        mat: false,
        image_name: "Action_token.png"
      },
      {
        name: "+1 Buy Tokens",
        token: true,
        mat: false,
        image_name: "Buy_token.png"
      },
      {
        name: "+1 Coin Tokens",
        token: true,
        mat: false,
        image_name: "PlusCoin_token.png"
      },
      {
        name: "-2 Cost Tokens",
        token: true,
        mat: false,
        image_name: "MinusCost_token.png"
      },
      {
        name: "-1 Card Tokens",
        token: true,
        mat: false,
        image_name: "MinusCard_token.png"
      },
      {
        name: "-1 Coin Tokens",
        token: true,
        mat: false,
        image_name: "MinusCoin_token.png"
      },
      {
        name: "Hexes",
        token: false,
        mat: false,
        image_name: "Hexes.jpg"
      },
      {
        name: "Boons",
        token: false,
        mat: false,
        image_name: "Boons.jpg"
      }
    ]

    material_data.each do |data|
      Material.create(
        name: data[:name],
        token: data[:token],
        mat: data[:mat],
        image_name: data[:image_name]
      )
    end
  end
end
