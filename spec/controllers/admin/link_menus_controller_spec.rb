require 'spec_helper'

describe Admin::LinkMenusController do
  let(:valid_attributes) { { "viewtext" => "MyText", "url" => "http://example.com", "enabled" => true } }

  let(:valid_session) { {} }
  before  do
    sign_in FactoryBot.create(:user, { role: "admin" })
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get :new
      expect(response).to be_success
    end
  end

  describe "POST 'create'" do
    it "redirect to index" do
      post :create, {:link_menu => valid_attributes}, valid_session
      expect(response).to redirect_to(admin_link_menus_url)
    end
  end

  describe "PUT 'update'" do
    it "redirect to index" do
      link_menu = LinkMenu.create! valid_attributes
      put :update, {:id => link_menu.to_param, link_menu: valid_attributes}, valid_session
      expect(response).to redirect_to(admin_link_menus_url)
    end
  end

  describe "DELETE 'destroy'" do
    it "redirect to link_menus list" do
      link_menu = LinkMenu.create! valid_attributes
      delete :destroy, {:id => link_menu.to_param, link_menu: valid_attributes}, valid_session
      expect(response).to redirect_to(admin_link_menus_url)
    end
  end

end
