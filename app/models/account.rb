class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true , uniqueness: {case_sensitive:false}
  validates :email, presence:true , uniqueness: {case_sensitive:false}
  has_many :posts, dependent: :destroy
  has_one_attached :avatar
  has_many :likes, dependent: :destroy
  has_many :notifications, dependent: :destroy

  def total_followers
    Follower.where(follower_id: self.id).count
  end

  def total_following
    Follower.where(following_id: self.id).count
  end

end
