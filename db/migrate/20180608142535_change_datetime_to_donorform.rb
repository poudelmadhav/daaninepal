class ChangeDatetimeToDonorform < ActiveRecord::Migration[5.2]
  def change
  	change_column :donorforms, :deadline, :date
  end
end
