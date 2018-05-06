class KingdomsController < ApplicationController
  def index
    @kingdoms = Kingdom.all
  end
end
