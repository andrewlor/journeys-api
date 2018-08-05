class Api::V1::JourneySerializer < ActiveModel::Serializer
  attributes :id, :user_id, :title, :mission_statement, :created_at
  has_many :journey_logs
  belongs_to :user
end
