# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Listing.destroy_all
User.destroy_all
Category.destroy_all


# {name: "Echeveria", description: "Echeveria succulent plants are vibrant and colorful, making Echeverias the perfect addition to any home, yard, or garden."},
# {name: "Crassula", description: "Crassula succulents for sale are perfect for any indoor or outdoor space. "},    # {name: "Haworthia", description: "Haworthia plants are hardy and resilient, making Haworthias the perfect indoor succulents."},
# {name: "Aloe", description: "Aloe vera barbadensis miller plants are easy-to-grow succulents. More commonly known as an Aloe vera plant, they are perhaps the most commonly used medical plant in the world.  In addition to the health benefits, they are great mixed in with desert landscaping, according to the University of Arizona Cooperative Extension. Because the plants are sensitive to cold, they can only be grown outdoors in U.S. Department of Agriculture plant hardiness zones 8 through 11. They do, however, grow very well indoors in pots."},
# {name: "Aeonium", description: "Aeonium succulents are a genus of succulents in the Crassulaceae family. Aeonium succulents are native to the Canary Islands, but can also be found in Morocco and East Africa. Aeonium succulents are unique and colorful succulent plants. Aeonium succulents are treasured amongst many succulent enthusiasts for their leaves that are incredibly similar to foliage leaves."},
# {name: "Cactus", description: "Cactus are versatile plants native to the Americas and love dry arid climates. Cactus are treasured plants among many collectors because of their unique shapes and their versatility to thrive in both outdoor and indoor spaces."},
# {name: "Other", description: "The type of this plant is not specified or unknown"}
Category.create!(name: "Echeveria", description: "Echeveria is a large genus of flowering plants in the family Crassulaceae, native to semi-desert areas of Central America, Mexico and northwestern South America.")
Category.create!(name: "Haworthia", description: "Haworthia is a large genus of small succulent plants endemic to Southern Africa (Mozambique, Namibia, Lesotho, Swaziland and South Africa). Like the aloes, they are members of the subfamily Asphodeloideae and they generally resemble miniature aloes, except in their flowers, which are distinctive in appearance. They are popular garden and container plants.")
Category.create!(name: "Crassula", description: "Crassula is a genus of succulent plants containing about 200 accepted species, including the popular jade plant (Crassula ovata). They are members of the stonecrop (Crassulaceae) family and are native to many parts of the globe, but cultivated varieties originate almost exclusively from species from the Eastern Cape of South Africa.")
Category.create!(name: "Aloe", description: "Aloe vera barbadensis miller plants are easy-to-grow succulents. More commonly known as an Aloe vera plant, they are perhaps the most commonly used medical plant in the world.  In addition to the health benefits, they are great mixed in with desert landscaping, according to the University of Arizona Cooperative Extension. Because the plants are sensitive to cold, they can only be grown outdoors in U.S. Department of Agriculture plant hardiness zones 8 through 11. They do, however, grow very well indoors in pots.")
Category.create!(name: "Aeonium", description: "Aeonium succulents are a genus of succulents in the Crassulaceae family. Aeonium succulents are native to the Canary Islands, but can also be found in Morocco and East Africa. Aeonium succulents are unique and colorful succulent plants. Aeonium succulents are treasured amongst many succulent enthusiasts for their leaves that are incredibly similar to foliage leaves.")
Category.create!(name: "Cactus", description: "Cactus are versatile plants native to the Americas and love dry arid climates. Cactus are treasured plants among many collectors because of their unique shapes and their versatility to thrive in both outdoor and indoor spaces.")
Category.create!(name: "Other", description: "The type of this plant is not specified or unknown")
Category.create!(name: "Stapelia", description: "Stapelia is a genus of low-growing, spineless, stem succulent plants, predominantly from South Africa with a few from other parts of Africa. Known globally as African starfish flowers, and locally as carrion flowers, members of the genus Stapelia are usually characterized by their foul-smelling flowers reminiscent of the odor of rotting meat.")
Category.create!(name: "Sedum", description: "Sedum is a large genus of flowering plants in the family Crassulaceae, members of which are commonly known as stonecrops. The genus has been described as containing up to 600 species, subsequently reduced to 400–500. The plants vary from annual and creeping herbs to shrubs.")
Category.create!(name: "Pseudolithos", description: "Pseudolithos is a genus of succulent flowering plants of the family Apocynaceae, indigenous to Somalia, Yemen and Oman.")


# categories.each { |category_data| Category.create!(category_data)}

user = User.create!(email: 'www.test@test.com', password: 'pppppp')
user2 = User.create!(email: 'jordanfox9415@gmail.com', password: 'pppppp')
user3 = User.create!(email: 'www.user3@test.com', password: 'pppppp')
user4 = User.create!(email: 'www.user4@test.com', password: 'qqqqqq')

a = Listing.create!(name: "My Echeveria", description: "Price negotiable, very nice plant", price: 10.0, categories: Category.where(name: 'Echeveria'), user_id: user.id)
a.plant_picture.attach(io: File.open(File.join(Rails.root, "/db/seed_pics/img_echiveria.jpg")), filename: "default_image" )

b = Listing.create!(name: "My Haworthia", description: "Price non-negotiable, pickup only", price: 10.0, categories: Category.where(name: 'Haworthia'), user_id: user.id)
b.plant_picture.attach(io: File.open(File.join(Rails.root, "/db/seed_pics/img2.jpg")), filename: "default_image" )

c = Listing.create!(name: "My Crassula", description: "My favourite plant", price: 10.0, categories: Category.where(name: 'Crassula'), user_id: user.id)
c.plant_picture.attach(io: File.open(File.join(Rails.root, "/db/seed_pics/img3.jpg")), filename: "default_image" )

d = Listing.create!(name: "My Aloe", description: "Free for pickup", price: 10.0, categories: Category.where(name: 'Aloe'), user_id: user.id)
d.plant_picture.attach(io: File.open(File.join(Rails.root, "/db/seed_pics/img4.jpg")), filename: "default_image" )

e = Listing.create!(name: "My Aeonium", description: "Free for pickup", price: 10.0, categories: Category.where(name: 'Aeonium'), user_id: user.id)
e.plant_picture.attach(io: File.open(File.join(Rails.root, "/db/seed_pics/img_Aeonium.jpg")), filename: "default_image" )

f = Listing.create!(name: "My Cactus", description: "Price negotiable", price: 10.0, categories: Category.where(name: 'Cactus'), user_id: user4.id)
f.plant_picture.attach(io: File.open(File.join(Rails.root, "/db/seed_pics/img5.jpg")), filename: "default_image" )

g = Listing.create!(name: "My Unknown Plant", description: "A plant that I stole from my neighbour. Price non-negotiable", price: 10.0, categories: Category.where(name: 'Other'), user_id: user.id)
g.plant_picture.attach(io: File.open(File.join(Rails.root, "/db/seed_pics/img6.jpg")), filename: "default_image" )

h = Listing.create!(name: "My Stapelia", description: "A plant that I stole from my neighbour. Price non-negotiable", price: 10.0, categories: Category.where(name: 'Stapelia'), user_id: user3.id)
h.plant_picture.attach(io: File.open(File.join(Rails.root, "/db/seed_pics/img6.jpg")), filename: "default_image" )

i = Listing.create!(name: "My beautiful Sedum", description: "A plant that I stole from my neighbour. Price non-negotiable", price: 10.0, categories: Category.where(name: 'Sedum'), user_id: user2.id)
i.plant_picture.attach(io: File.open(File.join(Rails.root, "/db/seed_pics/img6.jpg")), filename: "default_image" )

j = Listing.create!(name: "My Pseudolithos", description: "A plant that I stole from my neighbour. Price non-negotiable", price: 10.0, categories: Category.where(name: 'Pseudolithos'), user_id: user2.id)
j.plant_picture.attach(io: File.open(File.join(Rails.root, "/db/seed_pics/img6.jpg")), filename: "default_image" )

k = Listing.create!(name: "My Plant", description: "A plant that I stole from my neighbour. Price non-negotiable", price: 10.0, categories: Category.where(name: 'Other'), user_id: user2.id)
k.plant_picture.attach(io: File.open(File.join(Rails.root, "/db/seed_pics/img6.jpg")), filename: "default_image" )