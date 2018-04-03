class Ticket < ApplicationRecord
  belongs_to :event
  has_many :user_tickets
  has_many :users, through: :user_tickets

  validates :price, numericality: { greater_than: 0, only_integer: true }
  validate :creation_date_cannot_be_after_start_date

  def creation_date_cannot_be_after_start_date
    if event.start_date.present? && event.start_date < Date.today
      errors.add(:event.start_date, "the event already started or ended")
    end
  end
end
