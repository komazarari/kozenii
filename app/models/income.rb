class Income < ActiveRecord::Base
  validates :obtained_date, presence: true
  validates :amount, presence: true, numericality: { only_integer: true }
  validates :description, presence: true

  belongs_to :member
end
