class AddDonorTypeToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :donor, :boolean, default: true
  end
end
