class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :listings, dependent: :destroy

  has_many :requested_listings
  has_many :requested, through: :requested_listings, source: :listing # 'source' is the other table related to requests

end
