class Admin::GroupsController < Admin::BaseController
  before_action :admin_required
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  def index
    @groups = Group.all
  end

  def show
  end

  def new
    @group = Group.new
  end

  def edit
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:notice] = "Successfully created."
    end
    respond_with(@group, location: admin_groups_url)
  end

  def update
    if @group.update(group_params)
      flash[:notice] = "Successfully updated."
    end
    respond_with(@group, location: admin_groups_url)
  end

  def destroy
    @group.destroy
    flash[:notice] = "Deleted."
    respond_with(@group, location: admin_groups_url)
  end

  private
  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name)
  end
end
