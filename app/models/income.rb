class Income < ActiveRecord::Base
  validates :obtained_date, presence: true
  validates :amount, presence: true, numericality: { only_integer: true }
  validates :obtained_by, presence: true
end
