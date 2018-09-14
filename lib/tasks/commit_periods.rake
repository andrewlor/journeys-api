task :generate_commit_periods_next_week => [:environment] do
  journeys = Journey.all
  p journeys.count
  journeys.each do |journey|
    cp = journey.commit_periods.new
    cp.set_period_next_week
    p cp.save
  end
  p 'done'
end
