class Api::V1::CommitPeriodsController < Api::V1::JourneysController
  before_action :set_journey, :edit_journey_authorize_user

  # POST api/v1/journeys/:id/commit_periods
  def create
    commit_period = @journey.commit_periods.new
    if @journey.commit_periods.where(enddate: commit_period.enddate).count > 0
      return render json: { error: 'You already have a commit period for this week.' }, status: :ok
    end
    commit_period.save
    render json: commit_period, status: :ok
  end

  private

  def set_commit_period
    begin
      @commit_period = CommitPeriod.find(params[:commit_period_id])
    rescue ActiveRecord::RecordNotFound
      return render json: { errors: [ "Commit Period not found." ] }, status: 404
    end
  end
end
