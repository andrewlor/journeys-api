task :generate_commit_periods_next_week => [:environment] do
  next unless Date.today.wday == 5
  journeys = Journey.all
  p journeys.count
  journeys.each do |journey|
    temp_cp = CommitPeriod.new
    temp_cp.set_period_next_week
    next unless journey.commit_periods.empty? || journey.commit_periods.last.startdate != temp_cp.startdate
    old_cps = journey.commit_periods
    cp = journey.commit_periods.new
    cp.set_period_next_week
    p cp.save
  end
  p 'done'
end
