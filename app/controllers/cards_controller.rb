class CardsController < ApplicationController
  def index
    render :index, locals: {
      cards: Card.all
    }
  end
end
