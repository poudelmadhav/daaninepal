class AddDonorIdToDonatedAmount < ActiveRecord::Migration[5.2]
  def change
    add_reference :donated_amounts, :donated_amount, foreign_key: true
  end
end
