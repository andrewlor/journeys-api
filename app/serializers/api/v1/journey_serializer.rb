class Api::V1::JourneySerializer < Api::V1::BaseSerializer
  attributes :id, :title, :created_at, :username, :user_email, :user_image

  def username
    object.user.nickname
  end

  def user_email
    object.user.email
  end

  def user_image
    object.user.image.url
  end
end
