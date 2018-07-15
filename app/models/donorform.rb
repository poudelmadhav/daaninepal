class Donorform < ApplicationRecord
  belongs_to :user
  validates :title, :description, :promises, :amount, :deadline, presence: true
  delegate :name, :id, to: :user, prefix: true
  has_many :donations
  has_many :notifications, as: :notifiable, dependent: :destroy
end
