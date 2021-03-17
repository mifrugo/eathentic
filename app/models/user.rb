class User < ApplicationRecord
  before_validation :foo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :restaurants
  has_many :reviews
  has_many :dishes
  has_many :ingredients
  has_many :views
  belongs_to :cuisine

  has_one_attached :avatar

  def foo
    cuisine_id = 12
  end  
end
