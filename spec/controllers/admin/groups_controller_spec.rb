require 'spec_helper'

describe Admin::GroupsController do
  let(:valid_attributes) { { "name" => "MyGroupName", "show_order" => "10" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Admin::BudgetsController. Be sure to keep this updated too.
  let(:valid_session) { {} }
  before  do
    sign_in FactoryBot.create(:user, { role: "admin" })
  end


  describe "GET index" do
    it "assigns all groups as @groups" do
      group = Group.create! valid_attributes
      get :index, {}, valid_session
      assigns(:groups).should eq([group])
    end
  end

  describe "GET new" do
    it "assigns a new group as @group" do
      get :new, {}, valid_session
      assigns(:group).should be_a_new(Group)
    end
  end

  describe "GET edit" do
    it "assigns the requested group as @group" do
      group = Group.create! valid_attributes
      get :edit, {:id => group.to_param}, valid_session
      assigns(:group).should eq(group)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Group" do
        expect {
          post :create, {:group => valid_attributes}, valid_session
        }.to change(Group, :count).by(1)
      end

      it "assigns a newly created group as @group" do
        post :create, {:group => valid_attributes}, valid_session
        assigns(:group).should be_a(Group)
        assigns(:group).should be_persisted
      end

      it "redirects to the created group" do
        post :create, {:group => valid_attributes}, valid_session
        response.should redirect_to(admin_groups_url)
      end
    end

    describe "with invalid params" do
      before do
        Group.any_instance.stub(:save).and_return(false)
        Group.any_instance.stub(:errors).and_return({ name: "invalid" })
      end

      it "assigns a newly created but unsaved group as @group" do
        # Trigger the behavior that occurs when invalid params are submitted
        post :create, {:group => { "name" => "invalid value" }}, valid_session
        assigns(:group).should be_a_new(Group)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        post :create, {:group => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested group" do
        group = Group.create! valid_attributes
        # Assuming there are no other groups in the database, this
        # specifies that the Group created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Group.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => group.to_param, :group => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested group as @group" do
        group = Group.create! valid_attributes
        put :update, {:id => group.to_param, :group => valid_attributes}, valid_session
        assigns(:group).should eq(group)
      end

      it "redirects to the group" do
        group = Group.create! valid_attributes
        put :update, {:id => group.to_param, :group => valid_attributes}, valid_session
        response.should redirect_to(admin_groups_url)
      end
    end

    describe "with invalid params" do
      let(:group) { Group.create! valid_attributes }
      before do
        Group.any_instance.stub(:save).and_return(false)
        Group.any_instance.stub(:errors).and_return({ name: "invalid" })
      end

      it "assigns the group as @group" do
        # Trigger the behavior that occurs when invalid params are submitted
        put :update, {:id => group.to_param, :group => { name: "" }}, valid_session
        assigns(:group).should eq(group)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        put :update, {:id => group.to_param, :group => { name: "" }}, valid_session
        response.status.should eq 302
      end
    end
  end

end
