require 'spec_helper'

describe Balancer do
  let(:expense) { create(:expense) }
  let(:balancer) { Balancer.new(expense) }
  let(:new_income) { balancer.balance_out }

  describe "#balance_out" do
    it "create corresponding Income object" do
      expect(new_income).to be_an_instance_of Income
      expect(new_income).to be_valid
      expect(expense.closed?).to be_truthy
    end
  end

end
