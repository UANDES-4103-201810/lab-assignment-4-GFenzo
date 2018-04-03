class User < ApplicationRecord
  	has_many :user_tickets	
		has_many :tickets, :through => :user_tickets
		validates :email, presence: true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
		validates :phone, presence: true, length: { in: 9..12 }
		validates :password, presence: true, length: { in: 8..12 }, :format => { :with => /[a-z0-9]+[-a-z0-9]*[a-z0-9]+/i }
end
