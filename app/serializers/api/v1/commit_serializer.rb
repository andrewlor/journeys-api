class Api::V1::CommitSerializer < Api::V1::BaseSerializer
  attributes :id, :description, :repetitions, :repetitions_completed
end
