# -*- coding: utf-8 -*-
require 'spec_helper'

describe MembersController do
  def valid_attributes
    { fullname: 'testmember', nick: 'test', yomi: 'テスト' }
  end

  before  do
    sign_in FactoryGirl.create(:user)
  end
  let(:valid_session) { {} }

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      item = Member.create! valid_attributes
      get :show, { id: item.id }
      expect(assigns(:member)).to eq item
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Member" do
        expect {
          post :create, {member: valid_attributes}
        }.to change(Member, :count).by(1)
      end

      it "assigns a newly created member as @member" do
        post :create, {member: valid_attributes}
        assigns(:member).should be_a(Member)
        assigns(:member).should be_persisted
      end

      it "redirects to the members" do
        post :create, {member: valid_attributes}
        response.should redirect_to(members_url)
      end
    end

    describe "with invalid params" do
      before do
        Member.any_instance.stub(:save).and_return(false)
        Member.any_instance.stub(:errors).and_return({ fullname: "invalid" })
      end

      it "assigns a newly created but unsaved member as @member" do
        # Trigger the behavior that occurs when invalid params are submitted
        post :create, {:member => { "fullname" => "" }}, valid_session
        assigns(:member).should be_a_new(Member)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        post :create, {:member => { "fullname" => "" }}, valid_session
        response.should render_template("new")
      end
    end
  end
end
