class Donorform < ApplicationRecord
  belongs_to :user
  validates :title, :description, :promises, :amount, :deadline, presence: true
  delegate :name, :id, to: :user, prefix: true
  has_many :donations

 #  def is_valid_donation(donation)
	# return  @donation.amount - @donation.donations.sum("amount")
 #  end
end
