class Post < ApplicationRecord
    belongs_to :account
    has_one_attached :image
    validates :image, presence: true 
    has_many :likes, dependent: :destroy

    def total_likes
    0
    end

end
