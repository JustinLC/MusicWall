class Song < ActiveRecord::Base

	belongs_to :user

	validates :name, presence: true, length: {maximum: 30}
	validates :url, presence: true, length: {maximum: 150}
	validates :artist, presence: true, length: {maximum: 40}

end