class Donorform < ApplicationRecord
  belongs_to :user
  validates :title, :description, :promises, :amount, :deadline, presence: true
end
