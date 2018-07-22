class Api::V1::JourneySerializer < ActiveModel::Serializer
  attributes :id, :user_id, :title, :mission_statement
end
