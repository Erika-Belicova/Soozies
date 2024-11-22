class AddCoordinatesToSoozies < ActiveRecord::Migration[7.1]
  def change
    add_column :soozies, :latitude, :float
    add_column :soozies, :longitude, :float
  end
end
