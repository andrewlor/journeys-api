class Api::V1::CommitPeriodSerializer < ActiveModel::Serializer
  attributes :id, :startdate, :enddate
  has_many :commits
end
