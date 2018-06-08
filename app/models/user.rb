class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :masqueradable, :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :confirmable

  has_many :notifications, foreign_key: :recipient_id
  has_many :services
  has_many :donorforms, dependent: :destroy
  has_many :donated_amounts, dependent: :destroy
end
