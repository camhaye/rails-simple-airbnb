# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

95.times do
  flat = Flat.new(
    name: Faker::Lorem.sentence(word_count: 5),
    address: Faker::Address.street_address,
    description: Faker::Lorem.sentence(word_count: 20),
    price_per_night: (100..200).to_a.sample,
    number_of_guests: (1..20).to_a.sample
)
flat.save!
end
