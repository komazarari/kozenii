class Budget < ActiveRecord::Base
  validates :title, presence: true
  validates :amount, presence: true

  belongs_to :group
end
