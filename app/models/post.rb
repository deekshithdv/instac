class Post < ApplicationRecord
    default_scope{order created_at: :desc }
    belongs_to :account
    has_one_attached :image
    validates :image, presence: true 
    has_many :likes, dependent: :destroy
    has_many :comments
    has_many :notifications, dependent: :destroy
    
end
