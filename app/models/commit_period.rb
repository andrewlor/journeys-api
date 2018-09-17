class CommitPeriod < ApplicationRecord
  belongs_to :journey
  has_many :commits
  
  def set_period_this_week
    self.startdate = Date.today
    date = Date.parse('Sunday')
    delta = date >= Date.today ? 0 : 7
    self.enddate = date + delta
  end

  def set_period_next_week
    date = Date.parse('Monday')
    delta = date > Date.today ? 0 : 7
    self.startdate = date + delta
    self.enddate = self.startdate + 6.days
  end
end
