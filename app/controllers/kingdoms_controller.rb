class KingdomsController < ApplicationController
  def index
    @kingdoms = Kingdom.all
  end

  def create
    k = Kingdom.create(name: kingdom_params[:name])
    kingdom_params[:card_names].each do |card_name|
      k.cards << Card.find_by(name: card_name)
    end
  end

  private

  def kingdom_params
    params.require(:kingdom).permit(:name, :card_names)
  end
end
