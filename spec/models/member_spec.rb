require 'spec_helper'

describe Member do
  let(:member) { FactoryGirl.create(:member) }

  it "shows total amount of whom paids" do
    total_paid = 3.times.inject(0) { |s, v|
      s += FactoryGirl.create(:income, member_id: member.id).amount
    }
    expect(member.paid).to eq total_paid
  end
end
