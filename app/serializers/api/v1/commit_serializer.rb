class Api::V1::CommitSerializer < ActiveModel::Serializer
  attributes :description, :repetitions, :repetitions_completed
end
