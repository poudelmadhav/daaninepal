class AddDonorformIdToDonatedAmounts < ActiveRecord::Migration[5.2]
  def change
  	add_reference :donated_amounts, :donorform, foreign_key: true
  end
end
