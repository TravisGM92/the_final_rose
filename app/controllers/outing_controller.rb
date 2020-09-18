class OutingController < ApplicationController
  def show
    @contestants = Outing.find(params[:id]).contestants
    @outing = Outing.find(params[:id])
  end
end
