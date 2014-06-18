class LinkMenu < ActiveRecord::Base
  validates :viewtext, presence: true
  validates :url, presence: true

  scope :enabled, -> { where(enabled: true) }
end
