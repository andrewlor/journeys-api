class Api::V1::CommitPeriodSerializer < Api::V1::BaseSerializer
  attributes :id, :startdate, :enddate
  has_many :commits
end
