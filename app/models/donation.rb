class Donation < ApplicationRecord
	belongs_to :user
	belongs_to :donorform

	validates :donorform_id, :user_id, :donation_amount, presence: true
end
