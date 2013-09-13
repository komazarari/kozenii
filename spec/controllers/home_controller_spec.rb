require 'spec_helper'

describe HomeController do

  before  do
    sign_in FactoryGirl.create(:user)
  end

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

end
