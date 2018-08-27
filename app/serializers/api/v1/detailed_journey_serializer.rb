class Api::V1::DetailedJourneySerializer < Api::V1::JourneySerializer
  attributes :mission_statement, :commit_periods
  has_many :journey_logs
  has_many :commit_periods
  
  def journey_logs
    object.journey_logs.order(created_at: :desc)
  end

  def commit_periods
    object.commit_periods.order(enddate: :desc)
  end
end
