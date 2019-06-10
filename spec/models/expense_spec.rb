require 'spec_helper'

describe Expense do
  it { expect(FactoryBot.build(:expense)).to be_valid }

  it "requires a used_date" do
    expect(FactoryBot.build(:expense, used_date: "")).not_to be_valid
  end
  it "requires a amount" do
    expect(FactoryBot.build(:expense, amount: "")).not_to be_valid
  end
  it "requires a description" do
    expect(FactoryBot.build(:expense, description: "")).not_to be_valid
  end
end
