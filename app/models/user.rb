class User < ActiveRecord::Base
  has_many :post_its
  has_secure_password

  validates :username, presence: true
end
