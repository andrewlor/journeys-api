class DataPoint < ApplicationRecord
  belongs_to :journey_log
  belongs_to :journey
  enum unit: [:km, :mi, :lbs]
end
