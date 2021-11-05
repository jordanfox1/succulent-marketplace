class Listing < ApplicationRecord
    
    belongs_to :user
    has_many :categories, through: :listing_categories

    has_one_attached :plant_picture # active-storage will create this in the table automatically
end
