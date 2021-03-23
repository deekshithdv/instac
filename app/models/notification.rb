class Notification < ApplicationRecord
    belongs_to :notified_by, class_name: 'Account'
    belongs_to :account
    belongs_to :post
    validates :account_id, :notified_by_id, :post_id, :identifier, :notice_type, presence: true
end
