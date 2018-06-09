class CreateDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :donations do |t|
    	t.integer :user_id
    	t.integer :donorform_id
    	t.integer :donation_amount
      t.timestamps
    end
    add_index :donations, [:user_id, :donorform_id]
    add_index :donations, :donorform_id
  end
end
