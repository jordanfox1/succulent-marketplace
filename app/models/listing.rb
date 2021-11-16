class Listing < ApplicationRecord
    has_many :listing_categories, dependent: :destroy
    belongs_to :user
    has_many :categories, through: :listing_categories

    has_one_attached :plant_picture

    # validates the price, if the user enters an integer, it converts it to a float
    validates :price, presence: true, numericality: {only_float: true}

    

    validates :plant_picture, presence: { message: "Please provide a picture for your succulent!" }
    
    validates :name, length: {minimum: 1, maximum: 50}

    before_create :must_have_picture # active-storage will create this in the table automatically
end
