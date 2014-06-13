require 'spec_helper'

describe Income do
  it { expect(build(:income)).to be_valid }

  it "requires a obtained_date" do
    expect(build(:income, obtained_date: "")).not_to be_valid
  end

  it "requiresa an amount" do
    expect(build(:income, amount: "")).not_to be_valid
  end

  it "requires a description" do
    expect(build(:income, description: "")).not_to be_valid
  end
end
