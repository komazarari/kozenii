class Topic < ActiveRecord::Base
  validates :title, presence: true

  scope :enabled, -> { where(enabled: true) }
end
