class CommitPeriod < ApplicationRecord
  belongs_to :journey
  has_many :commits
  
  def set_period_this_week
    self.startdate = Date.today
    self.enddate = date_of_next('Sunday')
  end

  def set_period_next_week
    self.startdate = date_of_next('Monday')
    self.enddate = self.startdate + 6.days
  end

  private

  def date_of_next(day)
    date  = Date.parse(day)
    delta = date > Date.today ? 0 : 7
    date + delta
  end
end
