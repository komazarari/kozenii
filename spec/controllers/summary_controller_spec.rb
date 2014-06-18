require 'spec_helper'

describe SummaryController do
  before  do
    sign_in FactoryGirl.create(:user)
  end
  let(:valid_session) { {} }

  let(:valid_attributes_for_budget) { { "title" => "MyTitle", "amount" => "1425", "section" => 'out' } }

  describe "GET 'show'" do
    it "assigns all outgoings as @outgoings" do

      out = Budget.create! valid_attributes_for_budget
      get :show, {}, valid_session
      expect(assigns(:outgoings)).to eq([out])
    end

    it "assigns all incomes as @incomes" do
      inc = Budget.create! valid_attributes_for_budget.merge({ "section" => 'in' })
      get :show, {}, valid_session
      expect(assigns(:incomes)).to eq([inc])
    end

    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

end
