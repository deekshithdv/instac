class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true 
  validates :email, presence:true , uniqueness: {case_sensitive:false}
  has_many :posts, dependent: :destroy
  has_one_attached :avatar
end
