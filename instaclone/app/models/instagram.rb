class Instagram < ApplicationRecord
    mount_uploader:image, ImageUploader
    validates :image,:content, presence: true
    belongs_to :user
    has_many :favorites, dependent: :destroy
    has_many :fav_users, through: :favorites, source: :user
end
