class ContestantsController < ApplicationController

  def index
    @contestants = Bachelorette.find(params[:id]).contestants
  end
end
