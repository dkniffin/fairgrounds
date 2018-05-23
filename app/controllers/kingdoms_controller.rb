class KingdomsController < ApplicationController
  def index
    @kingdoms = Kingdom.all.includes(:cards)
  end

  def new
    render :new, locals: {
      cards: Card.all,
      kingdom: Kingdom.new
    }
  end

  def create
    kingdom = Kingdom.new(kingdom_params)
    if kingdom.save
      redirect_to action: :index
    else
      render :new, locals: {
        cards: Card.all,
        kingdom: kingdom
      }
    end
  end

  private

  def kingdom_params
    params.require(:kingdom).permit(
      :name,
      card_ids: []
    )
  end
end
