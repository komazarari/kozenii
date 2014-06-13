class Member < ActiveRecord::Base
  belongs_to :part
  has_many :incomes
  has_many :expenses

  scope :part_order, -> { Member.includes(:part).order("parts.show_order") }
end
