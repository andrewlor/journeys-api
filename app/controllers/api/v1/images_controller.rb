class Api::V1::ImagesController < Api::V1::BaseController

  # POST api/v1/profile_picture
  def upload_profile_picture
    params.require(:image)
    u = current_api_v1_user
    u.image = params[:image]
    u.save
    render json: { success: true }, status: :ok
  end
end
