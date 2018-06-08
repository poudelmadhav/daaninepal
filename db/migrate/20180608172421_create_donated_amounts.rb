class CreateDonatedAmounts < ActiveRecord::Migration[5.2]
  def change
    create_table :donated_amounts do |t|
      t.references :user, foreign_key: true
      t.integer :damount

      t.timestamps
    end
  end
end
