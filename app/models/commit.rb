class Commit < ApplicationRecord
  belongs_to :commit_period

  def completed?
    self.repetitions == self.repetitions_completed
  end

  def add_repetition!
    self.repetitions_completed += 1 if self.repetitions_completed < self.repetitions
    self.save
  end
end
