# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Listing.destroy_all
User.destroy_all

categories = [
    # {name: "Echeveria", description: "Echeveria succulent plants are vibrant and colorful, making Echeverias the perfect addition to any home, yard, or garden."},
    # {name: "Crassula", description: "Crassula succulents for sale are perfect for any indoor or outdoor space. "},
    # {name: "Haworthia", description: "Haworthia plants are hardy and resilient, making Haworthias the perfect indoor succulents."},
    # {name: "Aloe", description: "Aloe vera barbadensis miller plants are easy-to-grow succulents. More commonly known as an Aloe vera plant, they are perhaps the most commonly used medical plant in the world.  In addition to the health benefits, they are great mixed in with desert landscaping, according to the University of Arizona Cooperative Extension. Because the plants are sensitive to cold, they can only be grown outdoors in U.S. Department of Agriculture plant hardiness zones 8 through 11. They do, however, grow very well indoors in pots."},
    # {name: "Aeonium", description: "Aeonium succulents are a genus of succulents in the Crassulaceae family. Aeonium succulents are native to the Canary Islands, but can also be found in Morocco and East Africa. Aeonium succulents are unique and colorful succulent plants. Aeonium succulents are treasured amongst many succulent enthusiasts for their leaves that are incredibly similar to foliage leaves."},
    # {name: "Cactus", description: "Cactus are versatile plants native to the Americas and love dry arid climates. Cactus are treasured plants among many collectors because of their unique shapes and their versatility to thrive in both outdoor and indoor spaces."},
    # {name: "Other", description: "The type of this plant is not specified or unknown"}
    Category.create!(name: "Haworthia", description: "Haworthia plants are hardy and resilient, making Haworthias the perfect indoor succulents."),
    Category.create!(name: "Crassula", description: "Crassula succulents for sale are perfect for any indoor or outdoor space. "),
    Category.create!(name: "Aloe", description: "Aloe vera barbadensis miller plants are easy-to-grow succulents. More commonly known as an Aloe vera plant, they are perhaps the most commonly used medical plant in the world.  In addition to the health benefits, they are great mixed in with desert landscaping, according to the University of Arizona Cooperative Extension. Because the plants are sensitive to cold, they can only be grown outdoors in U.S. Department of Agriculture plant hardiness zones 8 through 11. They do, however, grow very well indoors in pots."),
    Category.create!(name: "Aeonium", description: "Aeonium succulents are a genus of succulents in the Crassulaceae family. Aeonium succulents are native to the Canary Islands, but can also be found in Morocco and East Africa. Aeonium succulents are unique and colorful succulent plants. Aeonium succulents are treasured amongst many succulent enthusiasts for their leaves that are incredibly similar to foliage leaves."),
    Category.create!(name: "Cactus", description: "Cactus are versatile plants native to the Americas and love dry arid climates. Cactus are treasured plants among many collectors because of their unique shapes and their versatility to thrive in both outdoor and indoor spaces."),
    Category.create!(name: "Other", description: "The type of this plant is not specified or unknown")
]

# categories.each { |category_data| Category.create!(category_data)}

user = User.create!(email: 'www.test@test.com', password: 'pppppp')

a = Listing.create!(name: "My Echeveria", description: "Price negotiable, very nice plant", price: 10.0, categories: Category.where(name: 'Haworthia'), user_id: user.id)
a.plant_picture.attach(io: File.open(File.join(Rails.root, "/db/seed_pics/img1.jpg")), filename: "default_image" )

b = Listing.create!(name: "My Haworthia", description: "Price non-negotiable, pickup only", price: 10.0, categories: Category.where(name: 'Crassula'), user_id: user.id)
b.plant_picture.attach(io: File.open(File.join(Rails.root, "/db/seed_pics/img2.jpg")), filename: "default_image" )

c = Listing.create!(name: "My Crassula", description: "My favourite plant", price: 10.0, categories: Category.where(name: 'Aloe'), user_id: user.id)
c.plant_picture.attach(io: File.open(File.join(Rails.root, "/db/seed_pics/img3.jpg")), filename: "default_image" )

d = Listing.create!(name: "My Aloe", description: "Free for pickup", price: 10.0, categories: Category.where(name: 'Aeonium'), user_id: user.id)
d.plant_picture.attach(io: File.open(File.join(Rails.root, "/db/seed_pics/img4.jpg")), filename: "default_image" )

e = Listing.create!(name: "My Cactus", description: "Price negotiable", price: 10.0, categories: Category.where(name: 'Cactus'), user_id: user.id)
e.plant_picture.attach(io: File.open(File.join(Rails.root, "/db/seed_pics/img5.jpg")), filename: "default_image" )

f = Listing.create!(name: "My Unknown Plant", description: "A plant that I stole from my neighbour. Price non-negotiable", price: 10.0, categories: Category.where(name: 'Other'), user_id: user.id)
f.plant_picture.attach(io: File.open(File.join(Rails.root, "/db/seed_pics/img6.jpg")), filename: "default_image" )