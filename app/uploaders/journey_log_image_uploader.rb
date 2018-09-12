class JourneyLogImageUploader < CarrierWave::Uploader::Base
  storage :fog

  def store_dir
    "uploads/journeys/#{model.journey_id}/journey_logs/#{model.id}"
  end
end
