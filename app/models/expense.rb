class Expense < ActiveRecord::Base
  validates :used_date, presence: true
  validates :amount, presence: true, numericality: { only_integer: true }
  validates :spend_for, presence: true
end
