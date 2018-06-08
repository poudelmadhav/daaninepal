class Donorform < ApplicationRecord
  belongs_to :user, dependent: :destroy
  validates :title, :description, :promises, :amount, :deadline, presence: true
  delegate :name, :id, to: :user, prefix: true
end
