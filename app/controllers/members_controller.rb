class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  before_action :set_form_options, only: [:new, :edit]
  respond_to :html, :json

  def index
    @members = Member.season(cs).all
  end

  def show
    @q_i = Income.where(member_id: @member.id).search(params[:q])
    @incomes =  @q_i.result.desc.page params[:page]

    @q_e = Expense.where(member_id: @member.id).search(params[:q])
    @expenses = @q_e.result.desc.page params[:page]
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

  def set_form_options
    @categories = Category.season(cs)
  end
end
