class User < ApplicationRecord

  has_many :events

  def pending_clockout
    Event.where(user: self, clockout_time: nil).first
  end

  def clock_in_out
    if event = pending_clockout
      event.clockout_time = Time.now
      event.save
    else
      event = self.events.create!(
        clockin_time: Time.now,
      )
    end
    event
   end

end
