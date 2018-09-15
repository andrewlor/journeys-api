class Journey < ApplicationRecord
  belongs_to :user
  has_many :journey_logs
  has_many :data_points
  has_many :commit_periods

  before_create :append_prefix
  after_create :create_commit_periods

  private

  def append_prefix
    self.title = "My Journey to #{self.title}"
  end

  def create_commit_periods
    this_week = self.commit_periods.new
    next_week = self.commit_periods.new
    this_week.set_period_this_week
    next_week.set_period_next_week
    this_week.save
    next_week.save
  end
end
