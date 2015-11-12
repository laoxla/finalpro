class User < ActiveRecord::Base
  has_secure_password
  has_many :towservices
  geocoded_by :address
  after_validation :geocode
end
