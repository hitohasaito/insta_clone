class User < ApplicationRecord
  validates:name, presence:true, length:{maximum: 30}
  validates:email, presence:true, length:{maximum: 100},uniqueness:true,
  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  validates:password, presence:true, length:{minimum:6}
  has_secure_password
  mount_uploader :profimage, ImageUploader
end
