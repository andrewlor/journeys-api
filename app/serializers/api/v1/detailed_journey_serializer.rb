class Api::V1::DetailedJourneySerializer < Api::V1::JourneySerializer
  attributes :mission_statement, :journey_logs
  
  def journey_logs
    object.journey_logs.order(created_at: :desc)
  end
end
