class Wine < ActiveRecord::Base
	VARIETALS = ['Cabernet Sauvignon', 'Chardonnay', 'Merlot', 'Moscato', 'Pinot', 'Pinot Noir', 'Riesling']
	validates :name, :year, :country, :varietal, presence: true
	validates :year,
	  numericality: {only_integer: true, greater_than_or_equal_to: 0},
	  unless: "year.blank?"
	validates :varietal, :inclusion => {:in => VARIETALS}  	
	has_many :log_entries, dependent: :destroy
	def average_rating
		if log_entries.loaded?
			log_entries.map(&:rating).compact.average
		else
		log_entries.average(:rating)
		end
	end	
end
