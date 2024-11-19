class ChangeColumnAddressOnSoozies < ActiveRecord::Migration[7.1]
  def change
    rename_column :soozies, :address, :city
  end
end
