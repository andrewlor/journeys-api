class Api::V1::JourneyLogSerializer < Api::V1::BaseSerializer
  attributes :id, :log, :created_at, :image
end
