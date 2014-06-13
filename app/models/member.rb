class Member < ActiveRecord::Base
  belongs_to :part

  scope :part_order, -> { Member.includes(:part).order("parts.show_order") }
end
