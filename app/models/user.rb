class User < ActiveRecord::Base

	has_many :songs

	validates :password, confirmation: true, presence: true, length: {minimum: 8, maximum: 30}
	validates :password_confirmation, presence: true, length: {minimum: 8, maximum: 30}

end 