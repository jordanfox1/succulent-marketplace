class Listing < ApplicationRecord
    has_many :listing_categories, dependent: :destroy
    has_many :categories, through: :listing_categories
    
    has_one_attached :plant_picture

    belongs_to :user
    has_many :requesters, through: :requested_listings, source: :user

    # Validates the price, if the user enters an integer, it converts it to a decimal to accuratly display price
    validates :price, presence: true, numericality: {only_decimal: true}

    # Validation for file type provided by the active_storage_validations gem. This will ensure only images are uploaded
    validates :plant_picture, attached: true, content_type: [:png, :jpg, :jpeg]
    
    # Validates and titleizes name attribute
    validates :name, length: {minimum: 1, maximum: 50}
    before_save :titleize_name

    validates :description, length: {maximum: 250}, allow_blank: true

    def titleize_name
        self.name = self.name.titleize
    end
end
