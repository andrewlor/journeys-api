class Api::V1::CommitsController < Api::V1::CommitPeriodsController
  before_action :set_commit_period, only: :create

  # POST api/v1/journeys/:journey_id/commit_periods/:commit_period_id/commits
  def create
    render json: @commit_period.commits.create(commits_params[:commits]), status: :ok
  end
  
  # PUT api/v1/journeys/:journey_id/commits/:commit_id
  def edit
    begin
      commit = Commit.find(params[:commit_id])
    rescue ActiveRecord::RecordNotFound
      return render json: { errors: [ "Commit not found." ] }, status: 404
    end
    commit.add_repetition!
    render json: commit, status: :ok
  end
  
  private

  def commits_params
    params.require(:commits)
    params.permit(commits: [:description, :repetitions])
  end
end
