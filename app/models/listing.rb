class Listing < ApplicationRecord
    has_many :listing_categories, dependent: :destroy
    belongs_to :user
    has_many :categories, through: :listing_categories

    has_one_attached :plant_picture

    validates :name, presence: { message: "Please enter a name for your succulent!" }
    validates :price, presence: { message: "Please enter a dollar value price for your succulent!" }
    validates :plant_picture, presence: { message: "Please provide a picture for your succulent!" }
    
    before_create :must_have_picture # active-storage will create this in the table automatically
end
