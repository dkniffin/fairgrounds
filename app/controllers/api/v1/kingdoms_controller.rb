class Api::V1::KingdomsController < Api::V1::ApiController
  def rating
    rating = Rating.new(rating_params)
    render_save(rating)
  end

  private

  def rating_params
    params.require(:kingdom).permit(:kingdom_id, :value)
  end
end
