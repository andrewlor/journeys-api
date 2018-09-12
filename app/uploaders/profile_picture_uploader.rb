class ProfilePictureUploader < CarrierWave::Uploader::Base
  storage :fog
  
  def store_dir
    "uploads/users/#{model.id}/profile_pictures"
  end
end
