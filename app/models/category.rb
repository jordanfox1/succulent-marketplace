class Category < ApplicationRecord
    has_many :listings, through: :listing_categories
end
