class Event < ApplicationRecord
  belongs_to :place
  has_many :tickets

  validate :start_date_cannot_past
  validates :place, uniqueness: { scope: :start_date,
                                 message: "there's an event taking place at that date and venue" }

  def start_date_cannot_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end
end
