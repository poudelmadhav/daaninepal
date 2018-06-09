class DeleteDonatedAmountToDonatedAmount < ActiveRecord::Migration[5.2]
  def change
  	remove_reference :donated_amounts, :donated_amount
  end
end