class Income < ActiveRecord::Base
  validates :obtained_date, presence: true
  validates :amount, presence: true, numericality: { only_integer: true }
  validates :description, presence: true

  belongs_to :season
  belongs_to :member
  belongs_to :budget

  include Seasonable
  scope :desc, -> { all.order("id DESC") }
end
