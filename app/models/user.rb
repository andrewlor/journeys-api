class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
  mount_uploader :image, ProfilePictureUploader

  has_many :journeys

  validates :nickname, uniqueness: true, presence: true

  def token_validation_response
    Api::V1::UserSerializer.new(self).as_json
  end
end
