class Api::V1::JourneysController < Api::V1::BaseController

  # GET api/v1/journeys
  def index
    render json: Journey.all, status: :ok
  end

  # GET api/v1/journeys/:id
  def show
    begin
      result = Journey.find(params[:id])
      render json: result, status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: { errors: [ "Journey not found." ] }, status: 404
    end
  end

  # POST api/v1/journeys
  def create
    result = current_api_v1_user.journeys.create!(journey_params)
    render json: result, status: :ok
  end

  # PUT api/v1/journeys/:id
  def update
    begin
      j = Journey.find(params[:id])
      if j.user_id == current_api_v1_user.id
        j.update_attributes(journey_update_params)
        render json: j, status: :ok
      else
        render json: { errors: [ "You are not authorized to update this journey." ] }, status: 403
      end
    rescue ActiveRecord::RecordNotFound
      render json: { errors: [ "Journey not found." ] }, status: 404
    end
  end

  private

  def journey_params
    params.require(
      [
        :title,
        :mission_statement
      ]
    )
    params.permit(:title, :mission_statement)
  end

  def journey_update_params
    params.permit(:title, :mission_statement)
  end
end
