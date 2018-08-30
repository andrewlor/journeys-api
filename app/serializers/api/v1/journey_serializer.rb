class Api::V1::JourneySerializer < Api::V1::BaseSerializer
  attributes :id, :title, :created_at, :user_email

  def user_email
    object.user.email
  end
end
