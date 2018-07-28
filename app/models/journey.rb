class Journey < ApplicationRecord
  belongs_to :user
  has_many :journey_logs
  has_many :data_points
end
