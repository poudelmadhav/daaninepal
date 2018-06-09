class DropDonatedForm < ActiveRecord::Migration[5.2]
  def change
  	drop_table :donated_amounts
  end
end
