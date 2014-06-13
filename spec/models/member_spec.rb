require 'spec_helper'

describe Member do
  let(:member) { FactoryGirl.create(:member) }
  before :all do
    @total_spent = 0
    @total_paid = 0
    3.times do
      @total_spent += FactoryGirl.create(:expense, member_id: member.id).amount
    end
    3.times do
      @total_paid += FactoryGirl.create(:income, member_id: member.id).amount
    end
  end

  it "shows total amount of whom paids" do
    expect(member.paid).to eq @total_paid
  end

#  it "shows total amount of whom spents" do
#    expect(member.paid).to eq @total_spent
#  end
  
end
