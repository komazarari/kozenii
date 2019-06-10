require 'spec_helper'

describe IncomesController do
  def valid_attributes
    { obtained_date: Date.new(2013,5,1), amount: 123, description: "test" }
  end

  before  do
    sign_in FactoryBot.create(:user, { role: "admin" })
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      item = Income.create! valid_attributes
      get 'show', { id: item.id }
      expect(assigns(:income)).to eq item
      expect(response).to be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new', { income: valid_attributes }
      expect(response).to be_success
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
        expect(assigns(:income)).to be_a(Income)
        expect(assigns(:income)).to be_persisted
      end

      it "redirect to the incomes" do
        post :create, { income: valid_attributes }
        expect(response).to redirect_to(incomes_path)
      end

      context "with invalid params" do
        it "assignes a newly created but unsaved incomes as@income" do
          allow_any_instance_of(Income).to receive(:save).and_return(false)
          post :create, { income: { amount: "invalid value" } }
          expect(assigns(:income)).to be_a_new(Income)
        end

        it "re-renders the 'new' template" do
          allow_any_instance_of(Income).to receive(:save).and_return(false)
          post :create, { income: { amount: "invalid value" } }
          expect(response.status).to eq 302
        end
      end
    end
  end

end
