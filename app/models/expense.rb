class Expense < ActiveRecord::Base
  validates :used_date, presence: true
  validates :amount, presence: true, numericality: { only_integer: true }
  validates :description, presence: true

  belongs_to :member
end
