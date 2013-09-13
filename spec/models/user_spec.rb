require 'spec_helper'

describe User do

  let(:attr) {
    { username: "sampleuser", password: "changeme",
      password_confirmation: "changeme"
    }
  }
  describe "create" do
    context "with valid_attributes" do
      it { expect(User.create!(attr)).to be_valid }
    end

    context "with duplicated username" do
      it do
        User.create!(attr)
        expect(User.new(attr)).not_to be_valid
      end
    end
  end
end
