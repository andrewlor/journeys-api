class Journey < ApplicationRecord
  belongs_to :user
  has_many :journey_logs
  has_many :data_points

  before_save :append_prefix

  private

  def append_prefix
    self.title = "My Journey to #{self.title}"
  end
end
