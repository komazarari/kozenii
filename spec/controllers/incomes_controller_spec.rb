require 'spec_helper'

describe IncomesController do
  def valid_attributes
    { obtained_date: Date.new(2013,5,1), amount: 123, description: "test" }
  end

  before  do
    sign_in FactoryGirl.create(:user)
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      item = Income.create! valid_attributes
      get 'show', { id: item.id }
      expect(assigns(:income)).to eq item
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new', { income: valid_attributes }
      response.should be_success
    end
  end

  describe "GET 'create'" do
    context "with valid params" do
      it "creates a new Income" do
        expect {
          post :create, { income: valid_attributes }
        }.to change(Income, :count).by(1)
      end

      it "assigns a newly created income as @income" do
        post :create, { income: valid_attributes }
        assigns(:income).should be_a(Income)
        assigns(:income).should be_persisted
      end

      it "redirect to the incomes" do
        post :create, { income: valid_attributes }
        response.should redirect_to(incomes_path)
      end

      context "with invalid params" do
        it "assignes a newly created but unsaved incomes as@income" do
          Income.any_instance.stub(:save).and_return(false)
          post :create, { income: { amount: "invalid value" } }
          assigns(:income).should be_a_new(Income)
        end

        it "re-renders the 'new' template" do
          Income.any_instance.stub(:save).and_return(false)
          post :create, { income: { amount: "invalid value" } }
          response.status.should eq 302
        end
      end
    end
  end

end
