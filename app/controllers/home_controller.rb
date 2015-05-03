class HomeController < ApplicationController
  before_action :set_in_out, only: [:index]

  def index
    @users = User.all
  end
end
