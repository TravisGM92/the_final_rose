class BacheloretteController < ApplicationController

  def show
    @bach = Bachelorette.find(params[:id])
  end

end
