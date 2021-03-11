class Post < ApplicationRecord
    belongs_to :account
    has_one_attached :image
    validates :image, presence: true 

    def total_likes
    0
    end

end
