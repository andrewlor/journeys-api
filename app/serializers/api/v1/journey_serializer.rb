class Api::V1::JourneySerializer < Api::V1::BaseSerializer
  attributes :id, :title, :created_at, :username

  def username
    object.user.nickname
  end
end
