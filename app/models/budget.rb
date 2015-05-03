class Budget < ActiveRecord::Base
  validates :title, presence: true
  validates :amount, presence: true

  belongs_to :season
  belongs_to :group
  has_many :expenses
  has_many :incomes

  include Seasonable
  scope :group_order, -> { includes(:group).order("groups.show_order") }
  scope :incomes, -> { where(section: 'in') }
  scope :outgoings, -> { where(section: 'out') }
  scope :default_income, -> { find_by(default_income: true) }
  scope :default_expense, -> { find_by(default_expense: true) }
end
