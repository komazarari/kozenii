class Member < ActiveRecord::Base
  belongs_to :season
  belongs_to :part
  belongs_to :category
  has_many :incomes
  has_many :expenses

  validates :fullname, presence: true

  include Seasonable
  scope :part_order, -> { Member.includes(:part).order("parts.show_order") }

  def paid
    incomes.inject(0) { |s, income| s += income.amount }
  end

  def bill
    category ? category.basic_due + category.ext_due : 0
  end

  def remain
    bill - paid
  end
end
