require 'spec_helper'

describe SummaryController do
  before  do
    sign_in FactoryBot.create(:user)
  end
  let(:valid_session) { {} }
  let(:season) { Season.create }

  let(:valid_attributes_for_budget) { { "title" => "MyTitle", "amount" => "1425", "section" => 'out' } }

  describe "GET 'show'" do
    it "assigns all outgoings as @outgoings" do

      out = Budget.create! valid_attributes_for_budget
      get :show, {}, valid_session
      expect(assigns(:budget_outgoings)).to eq([out])
    end

    it "assigns all incomes as @incomes" do
      inc = Budget.create! valid_attributes_for_budget.merge({ "section" => 'in' })
      get :show, {}, valid_session
      expect(assigns(:budget_incomes)).to eq([inc])
    end

    it "returns http success" do
      get 'show'
      expect(response).to be_success
    end
  end

end
