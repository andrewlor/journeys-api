class Api::V1::JourneysController < Api::V1::BaseController
  before_action :set_journey, only: [:show, :update]
  before_action :edit_journey_authorize_user, only: :update

  # GET api/v1/journeys
  def index
    render json: Journey.all.order(created_at: :desc), status: :ok
  end

  # GET api/v1/my_journeys
  def my_journeys
    render json: current_api_v1_user.journeys.order(created_at: :desc), status: :ok
  end

  # GET api/v1/journeys/:id
  def show
    render json: @journey, status: :ok, serializer: Api::V1::DetailedJourneySerializer
  end

  # POST api/v1/journeys
  def create
    result = current_api_v1_user.journeys.create!(journey_params)
    render json: result, status: :ok
  end

  # PUT api/v1/journeys/:id
  def update
    @journey.update_attributes(journey_update_params)
    render json: @journey, status: :ok
  end

  private

  def set_journey
    begin
      @journey = Journey.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      return render json: { errors: [ "Journey not found." ] }, status: 404
    end
  end

  def edit_journey_authorize_user
    if @journey.user_id != current_api_v1_user.id
      return render json: { errors: [ "You are not authorized to update this journey." ] }, status: 403
    end
  end

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
