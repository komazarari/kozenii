# -*- coding: utf-8 -*-
require 'spec_helper'

describe MembersController do
  def valid_attributes
    { fullname: 'testmember', nick: 'test', yomi: 'テスト' }
  end

  before  do
    sign_in FactoryBot.create(:user)
  end
  let(:valid_session) { {} }

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      item = Member.create! valid_attributes
      get :show, { id: item.id }
      expect(assigns(:member)).to eq item
      expect(response).to be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      expect(response).to be_success
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
        expect(assigns(:member)).to be_a(Member)
        expect(assigns(:member)).to be_persisted
      end

      it "redirects to the members" do
        post :create, {member: valid_attributes}
        expect(response).to redirect_to(members_url)
      end
    end

    describe "with invalid params" do
      before do
        allow_any_instance_of(Member).to receive(:save).and_return(false)
        allow_any_instance_of(Member).to receive(:errors).and_return({ fullname: "invalid" })
      end

      it "assigns a newly created but unsaved member as @member" do
        # Trigger the behavior that occurs when invalid params are submitted
        post :create, {:member => { "fullname" => "" }}, valid_session
        expect(assigns(:member)).to be_a_new(Member)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        post :create, {:member => { "fullname" => "" }}, valid_session
        expect(response).to render_template("new")
      end
    end
  end
end
