class Api::V1::JourneySerializer < ActiveModel::Serializer
  attributes :id, :title, :mission_statement
end
