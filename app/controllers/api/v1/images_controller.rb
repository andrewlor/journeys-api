class Api::V1::ImagesController < Api::V1::BaseController

  # POST api/v1/profile_picture
  def upload_profile_picture
    params.require(:image)
    u = current_api_v1_user
    filename = "#{u.id}-#{Time.now.strftime('%s')}"
    File.open(filename, 'wb') do |f|
      f.write(Base64.decode64(params[:image]))
      u.image = f
    end
    u.save
    File.delete(filename)
    render json: current_api_v1_user, status: :ok
  end
end
