class Event < ApplicationRecord
  belongs_to :user

  validates_presence_of :user_id, :clockin_time
  validate :clockout_gte_clockin

  def clockout_gte_clockin
    if clockout_time && clockin_time && clockout_time <= clockin_time
      errors.add(:clockout_time, "can't be less than clock in time")
    end
  end

  def prevent_event_overlap
    raise NotImplementedError
  end
end
