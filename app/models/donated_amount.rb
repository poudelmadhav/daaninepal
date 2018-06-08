class DonatedAmount < ApplicationRecord
  belongs_to :user
  belongs_to :donated_amount, class_name: "Donorform"
end
