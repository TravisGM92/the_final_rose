class ContestantController < ApplicationController

  def index
    @contestants = Bachelorette.find(params[:id]).contestants
  end

  def show
    @contestant = Contestant.find(params[:id])
    @bachelorette = Bachelorette.joins(:contestants).where(contestants: {id: params[:id]})[0]
  end
end
