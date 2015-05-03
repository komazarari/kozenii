class SeasonsController < ApplicationController
  def index
    render json: Season.all
  end

  def show
    render json: Season.find(params[:id])
  end

  def update
    if params[:id].present?
      session[:season_id] = params[:id]
    end
    redirect_to request.referer
  end
end
