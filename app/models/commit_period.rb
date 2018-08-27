class CommitPeriod < ApplicationRecord
  belongs_to :journey
  has_many :commits

  after_initialize :set_period

  private
  
  def set_period
    self.startdate = Date.today
    self.enddate = date_of_next 'Sunday'
  end

  def date_of_next(day)
    date  = Date.parse(day)
    delta = date > Date.today ? 0 : 7
    date + delta
  end
end
