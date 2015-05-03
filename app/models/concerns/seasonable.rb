module Seasonable
  extend ActiveSupport::Concern

  included do
    scope :season, ->(id) { where(season_id: id) if id.present? }
  end
end
