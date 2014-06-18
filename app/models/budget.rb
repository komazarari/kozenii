class Budget < ActiveRecord::Base
  validates :title, presence: true
  validates :amount, presence: true

  belongs_to :group
  has_many :expenses
  has_many :incomes

  scope :group_order, -> { includes(:group).order("groups.show_order") }
end
