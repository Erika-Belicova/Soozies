class ChangeColumnBirthdateOnSoozies < ActiveRecord::Migration[7.1]
  def change
    remove_column :soozies, :birthdate
    add_column :soozies, :age, :integer
  end
end
