class Api::V1::DetailedJourneySerializer < Api::V1::JourneySerializer
  attributes :mission_statement
  has_many :journey_logs
end
