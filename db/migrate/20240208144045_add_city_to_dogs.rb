class AddCityToDogs < ActiveRecord::Migration[7.1]
  def change
    add_reference :dogs, :city, null: false, foreign_key: true
  end
end
