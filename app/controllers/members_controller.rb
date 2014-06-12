class MembersController < ApplicationController
  before_action :set_member, only: [:show]
  respond_to :html, :json

  def index
    @members = Member.all
  end

  def show
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      flash[:notice] = "Successfully created."
    end
    respond_with(@member, location: members_url)
  end

  private
  def set_member
    @member = Member.find(params[:id])
  end

  def member_params
    params.require(:member).permit(:fullname, :nick, :yomi, :obligation)
  end

end
