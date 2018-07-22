class Api::V1::JourneysController < Api::V1::BaseController

  # GET api/v1/journeys
  def index
    render json: { data: Journey.all }, status: :ok
  end

  # GET api/v1/journeys/:id
  def show
    begin
      result = Journey.find(params[:id])
      render json: { data: result }, status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: { errors: [ "Journey not found." ] }, status: 404
    end
  end

  # POST api/v1/journeys
  def create
    result = current_api_v1_user.journeys.create!(journey_params)
    render json: { data: result }, status: :ok
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
end
