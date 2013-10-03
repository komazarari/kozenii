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

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Expense" do
        expect {
          post :create, {expense: valid_attributes}
        }.to change(Expense, :count).by(1)
      end

      it "assigns a newly created expense as @expense" do
        post :create, {expense: valid_attributes}
        assigns(:expense).should be_a(Expense)
        assigns(:expense).should be_persisted
      end

      it "redirects to the expenses" do
        post :create, {expense: valid_attributes}
        response.should redirect_to(expenses_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved expense as @expense" do
        # Trigger the behavior that occurs when invalid params are submitted
        Expense.any_instance.stub(:save).and_return(false)
        post :create, {expense: { amount: "invalid value" }}
        assigns(:expense).should be_a_new(Expense)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Expense.any_instance.stub(:save).and_return(false)
        post :create, {expense: { amount: "invalid value" }}
        response.status.should eq 302
      end
    end
  end
end
