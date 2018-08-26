class Api::V1::JourneyLogSerializer < ActiveModel::Serializer
  attributes :id, :log, :created_at
end
