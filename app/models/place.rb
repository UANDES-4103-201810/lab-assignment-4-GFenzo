class Place < ApplicationRecord
	has_many :events
	validates :name, presence: true, length: { minimum: 20 }
	validates :capacity, numericality: { greater_than: 0, only_integer: true }
end
