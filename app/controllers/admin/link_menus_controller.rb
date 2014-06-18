class Admin::LinkMenusController < ApplicationController
  before_action :admin_required
  before_action :set_link_menu, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  def index
    @link_menus = LinkMenu.all
  end

  def new
    @link_menu = LinkMenu.new
  end

  def edit
  end

  def create
    @link_menu = LinkMenu.new(link_menu_params)
    if @link_menu.save
      flash[:notice] = "Successfully created."
    end
    respond_with(@link_menu, location: admin_link_menus_url)
  end

  def update
    if @link_menu.update(link_menu_params)
      flash[:notice] = "Successfully created."
    end
    respond_with(@link_menu, location: admin_link_menus_url)
  end

  def destroy
    @link_menu.destroy
    flash[:notice] = "Deleted."
    respond_with(@link_menu, location: admin_link_menus_url)
  end

  private
  def set_link_menu
    @link_menu = LinkMenu.find(params[:id])
  end

  def link_menu_params
    params.require(:link_menu).permit(:name, :viewtext, :url, :enabled)
  end
end
