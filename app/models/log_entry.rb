class LogEntry < ActiveRecord::Base
	belongs_to :wine
	RATING = 1..5
	validates :name, :comments, :tasted_on, :rating, :location, presence: true
	validates :comments, length: { minimum: 15 }, unless: 'comments.blank?'
	validates :rating, inclusion: { in: RATING, message: "must be from #{RATING.first} to #{RATING.last}" }
	
end
