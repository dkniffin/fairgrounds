class PlaysController < ApplicationController
  def create
    play = Play.new(play_params)
    if play.save
      redirect_to kingdom_path(play.kingdom_id), notice: "Your play was logged successfully"
    else
      render "kingdoms/show", locals: {
        kingdom: Kingdom.find(play_params[:kingdom_id]),
        play: play
      }
    end
  end

  private

  def play_params
    params.require(:play).permit(:kingdom_id, :number_of_players, :rating)
  end
end
