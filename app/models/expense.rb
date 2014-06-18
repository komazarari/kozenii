class Expense < ActiveRecord::Base
  validates :used_date, presence: true
  validates :amount, presence: true, numericality: { only_integer: true }
  validates :description, presence: true

  belongs_to :member
  belongs_to :budget

  scope :not_closed, -> { where.not(status: ['closed']) }
  scope :not_associated, -> { where(budget_id: nil) }
end
