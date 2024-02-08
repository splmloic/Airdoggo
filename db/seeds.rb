# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Supprimer toutes les données existantes
Dog.destroy_all
Dogsitter.destroy_all
City.destroy_all

# Créer des villes fictives
city1 = City.create(city_name: 'Toulouse')
city2 = City.create(city_name: 'Albi')
city3 = City.create(city_name: 'Narbonne')
city4 = City.create(city_name: 'Tarbes')

# Créer des chiens avec des associations aléatoires de villes
10.times do
  dog = Dog.create(
    name: Faker::FunnyName.name,
    age: rand(1..20),
    city: [city1, city2, city3, city4].sample,
  )
end

#Créer les promenneurs avec des associations aléatoires de villes
10.times do
    dogsitter = Dogsitter.create(
      name: Faker::Name.first_name,
      age: rand(1..99),
      city: [city1, city2, city3, city4].sample
    )
end

# Créer des rendez-vous fictifs entre chiens et promenneurs
20.times do
    dog = Dog.all.sample
    dogsitter = Dogsitter.all.sample
    Stroll.create(
      dog: dog,
      dogsitter: dogsitter,
    )
end