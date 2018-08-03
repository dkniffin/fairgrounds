class KingdomsController < ApplicationController
  def index
    render :index, locals: {
      kingdoms: Kingdom.all.includes(:cards)
    }
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
      redirect_to kingdom_path(kingdom), notice: "Your kingdom was created successfully"
    else
      render :new, locals: {
        cards: Card.all,
        kingdom: kingdom
      }
    end
  end

  def show
    kingdom = Kingdom.find(params[:id])
    render :show, locals: {
      kingdom: kingdom,
      play: Play.new(kingdom: kingdom)
    }
  end

  private

  def kingdom_params
    params.require(:kingdom).permit(
      :name,
      card_ids: []
    )
  end
end
