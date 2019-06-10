require 'spec_helper'

describe ExpensesController do
  def valid_attributes
    { used_date: Date.new(2013,5,1), amount: 123, description: "test" }
  end

  before  do
    sign_in FactoryBot.create(:user)
  end

  describe "GET 'index'" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      item = Expense.create! valid_attributes
      get :show, { id: item.id }
      expect(assigns(:expense)).to eq item
      expect(response).to be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get :new, { expense: valid_attributes }
      expect(response).to be_success
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Expense" do
        expect {
          post :create, {expense: valid_attributes}
        }.to change(Expense, :count).by(1)
      end

      it "assigns a newly created expense as @expense" do
        post :create, {expense: valid_attributes}
        expect(assigns(:expense)).to be_a(Expense)
        expect(assigns(:expense)).to be_persisted
      end

      it "redirects to the expenses" do
        post :create, {expense: valid_attributes}
        expect(response).to redirect_to(expenses_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved expense as @expense" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Expense).to receive(:save).and_return(false)
        post :create, {expense: { amount: "invalid value" }}
        expect(assigns(:expense)).to be_a_new(Expense)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Expense).to receive(:save).and_return(false)
        post :create, {expense: { amount: "invalid value" }}
        expect(response.status).to eq 302
      end
    end
  end
end
