class Member < ActiveRecord::Base
  belongs_to :part
  has_many :incomes
  has_many :expenses

  scope :part_order, -> { Member.includes(:part).order("parts.show_order") }

  def paid
    incomes.inject(0) { |s, income| s += income.amount }
  end
end
