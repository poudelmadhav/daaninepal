class CreateDonorforms < ActiveRecord::Migration[5.2]
  def change
    create_table :donorforms do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :description
      t.integer :amount
      t.text :promises
      t.boolean :approve, default: false
      t.boolean :reject, default: false
      t.datetime :deadline

      t.timestamps
    end
  end
end
