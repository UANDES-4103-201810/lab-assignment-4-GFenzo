class UserTicket < ApplicationRecord
  belongs_to :user
  belongs_to :ticket

  validate :bought_date_cannot_be_after_start_date

  def bought_date_cannot_be_after_start_date
    if ticket.event.start_date.present? && time > ticket.event.start_date
      errors.add(:time, "the event already started or ended")
    end
  end
end
