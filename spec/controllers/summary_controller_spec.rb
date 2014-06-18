require 'spec_helper'

describe SummaryController do
  before  do
    sign_in FactoryGirl.create(:user)
  end
  let(:valid_attributes_for_budget) { { "title" => "MyTitle", "amount" => "1425" } }
  let(:valid_session) { {} }

  describe "GET 'show'" do
    it "assigns all budgets as @budgets" do
      budget = Budget.create! valid_attributes_for_budget
      get :show, {}, valid_session
      expect(assigns(:budgets)).to eq([budget])
    end

    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

end
