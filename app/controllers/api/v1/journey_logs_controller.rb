class Api::V1::JourneyLogsController < Api::V1::JourneysController
  before_action :set_journey, :edit_journey_authorize_user

  # POST api/v1/journeys/:id/journey_logs
  def create
    journey_log = @journey.journey_logs.create(journey_log_params)
    
    if data_point_params.present?
      begin
        data_point = DataPoint.new(data_point_params)
      rescue ArgumentError
        journey_log.destroy!
        return render json: { errors: ["Invalid unit."] }, status: 400
      end
      
      data_point.journey_log_id = journey_log.id
      data_point.journey_id = @journey.id
      
      result = data_point.save
      if !result
        journey_log.destroy!
        return render json: { errors: data_point.errors.full_messages }, status: 400
      end
    end

    if params[:image].present?
      filename = "#{journey_log.id}-#{Time.now.strftime('%s')}"
      File.open(filename, 'wb') do |f|
        f.write(Base64.decode64(params[:image]))
        journey_log.image = f
      end
      journey_log.save
      File.delete(filename)
    end
    
    render json: journey_log, status: :ok
  end

  # DELETE api/v1/journeys/:journey_id/journey_logs/:id
  def destroy
    JourneyLog.find(params[:id]).destroy
    render json: {}, status: :ok
  end

  private

  def journey_log_params
    params.require(:log)
    params.permit(:log)
  end

  def data_point_params
    dp_params = params.permit(data_point: [:unit, :data])
    if dp_params.present?
      dp_params[:data_point].require([:data, :unit])
      return dp_params[:data_point].permit(:unit, :data)
    else
      return nil
    end
  end
end
