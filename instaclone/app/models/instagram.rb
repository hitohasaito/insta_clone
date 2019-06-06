class Instagram < ApplicationRecord
    mount_uploader:image, ImageUploader
    belongs_to :user
    #has_many :favorites, dependent: :destroy
    #has_many :fav_users, through: :favorites, source: :user
end
