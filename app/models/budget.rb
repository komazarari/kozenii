class Budget < ActiveRecord::Base
  validates :title, presence: true
  validates :amount, presence: true

  belongs_to :season
  belongs_to :group
  has_many :expenses
  has_many :incomes

  scope :group_order, -> { includes(:group).order("groups.show_order") }
  scope :incomes, -> { where(section: 'in') }
  scope :outgoings, -> { where(section: 'out') }

  class << self
    def default_income
      find_by(default_income: true)
    end

    def default_expense
      find_by(default_expense: true)
    end
  end
end
