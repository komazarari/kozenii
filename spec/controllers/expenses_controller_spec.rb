require 'spec_helper'

describe ExpensesController do
  def valid_attributes
    { used_date: Date.new(2013,5,1), amount: 123, spend_for: "test" }
  end

  before  do
    sign_in FactoryGirl.create(:user)
  end

  describe "GET 'index'" do
    it "returns http success" do
      get :index
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      item = Expense.create! valid_attributes
      get :show, { id: item.id }
      expect(assigns(:expense)).to eq item
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get :new
      response.should be_success
    end
  end

end
