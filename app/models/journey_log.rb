class JourneyLog < ApplicationRecord
  belongs_to :journey
  has_one :data_point
  mount_uploader :image, JourneyLogImageUploader
end
