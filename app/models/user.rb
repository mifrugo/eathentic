class User < ApplicationRecord
  include CloudinaryHelper
  include Lavatar::Helpers
  include ActionView::Context

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  acts_as_token_authenticatable

  has_many :restaurants
  has_many :reviews
  has_many :dishes
  has_many :ingredients
  has_many :views
  has_many :favorite_restaurants, dependent: :destroy
  belongs_to :cuisine

  has_one_attached :avatar

  validates :nickname, presence: true, uniqueness: true, length: { minimum: 3 }

  def navbar_avatar(size: 40)
    if avatar.attached?
      cl_image_tag(avatar.key, class: 'avatar')
    else
      lavatar_tag(nickname[0], size, { class: 'avatar' })
    end
  end

  def restaurant_favorite_ids
    favorite_restaurants.map(&:restaurant_id)
  end

end
