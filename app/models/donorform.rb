class Donorform < ApplicationRecord
  belongs_to :user
  validates :title, :description, :promises, :amount, :deadline, presence: true
  delegate :name, to: :user, prefix: true
end
