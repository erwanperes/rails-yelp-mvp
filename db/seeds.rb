# Supprime les enregistrements existants pour éviter les doublons
Restaurant.destroy_all
Review.destroy_all

# Crée des restaurants valides
restaurants = [
  { name: 'Chinese Palace', address: '123 Main St', phone_number: '555-1234', category: 'chinese' },
  { name: 'Italian Bistro', address: '456 Elm St', phone_number: '555-5678', category: 'italian' },
  { name: 'Sushi House', address: '789 Oak St', phone_number: '555-9101', category: 'japanese' },
  { name: 'French Cuisine', address: '101 Pine St', phone_number: '555-1122', category: 'french' },
  { name: 'Belgian Waffle', address: '202 Maple St', phone_number: '555-3344', category: 'belgian' }
]

# Crée les restaurants dans la base de données
restaurants.each do |attributes|
  restaurant = Restaurant.create!(attributes)

  # Crée des avis pour chaque restaurant
  3.times do |i|
	Review.create!(
	  rating: rand(0..5),
	  content: "Great experience! #{i + 1}",
	  restaurant: restaurant
	)
  end
end

puts "Seed data created successfully!"
