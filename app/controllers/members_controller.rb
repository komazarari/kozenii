class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  def index
    @members = Member.all
  end

  def show
    @expenses = Expense.where(member_id: @member.id)
    @incomes = Income.where(member_id: @member.id)
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

  def update
    if @member.update(member_params)
      flash[:notice] = "Successfully updated."
    end
    respond_with(@member, location: members_url)
  end

  def destroy
    @member.destroy
    flash[:notice] = "Deleted."
    respond_with(@member, location: members_url)
  end

  private
  def set_member
    @member = Member.find(params[:id])
  end

  def member_params
    params.require(:member).permit(:fullname,
                                   :nick,
                                   :yomi,
                                   :part_id,
                                   :category_id,
                                   :obligation)
  end

end
