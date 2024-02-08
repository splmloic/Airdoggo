class AddCityToDogsitters < ActiveRecord::Migration[7.1]
  def change
    add_reference :dogsitters, :city, null: false, foreign_key: true
  end
end
