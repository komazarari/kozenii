class Group < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :season
  has_many :budgets

  include Seasonable
end
